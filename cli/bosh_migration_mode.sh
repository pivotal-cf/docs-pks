#!/bin/bash

#Run this script on anywhere reachable to Opsmanager
#The launcher should be able to run OMCLI, BOSH CLI, yq and has BOSH client env exported.
#
#OMCLI: https://docs.pivotal.io/ops-manager/2-10/install/cli.html
#BOSH CLI: https://bosh.io/docs/cli-v2-install/
#yq CLI: https://github.com/mikefarah/yq
#        https://mikefarah.gitbook.io/yq/v/v3.x/
#
#To export BOSH client env, for example:
#export BOSH_CLIENT=ops_manager BOSH_CLIENT_SECRET=EKoiTmr3qq1LfpBncF4vAyxZWUSpqbX- BOSH_CA_CERT=/var/tempest/workspaces/default/root_ca_certificate BOSH_ENVIRONMENT=88.0.0.3 bosh

set -eu

function config_bosh_migrate_mode(){
  use_policy_api=$1
  policy_api_migration_mode=$2
  echo "Export bosh configuration to bosh.yml"
  $omcli staged-director-config --no-redact > bosh.yml
  nsx_manager=$(bosh int bosh.yml --path /iaas-configurations/name=default/nsx_address)
  nsx_manager_username=$(bosh int bosh.yml --path /iaas-configurations/name=default/nsx_username)
  nsx_manager_password=$(bosh int bosh.yml --path /iaas-configurations/name=default/nsx_password)

  cur_sec=`date '+%s'`
  echo "Backup bosh.yml to" bosh.yml.$cur_sec.bak
  cp bosh.yml bosh.yml.$cur_sec.bak
  yq -i ".iaas-configurations.[].additional_cloud_properties.nsxt.host=\"${nsx_manager}\"" bosh.yml
  yq -i ".iaas-configurations.[].additional_cloud_properties.nsxt.username=\"${nsx_manager_username}\"" bosh.yml
  yq -i ".iaas-configurations.[].additional_cloud_properties.nsxt.password=\"${nsx_manager_password}\"" bosh.yml
  yq -i ".iaas-configurations.[].additional_cloud_properties.nsxt.use_policy_api=${use_policy_api}" bosh.yml
  yq -i ".iaas-configurations.[].additional_cloud_properties.nsxt.policy_api_migration_mode=${policy_api_migration_mode}" bosh.yml

  yq -r ".iaas-configurations.[].nsx_ca_certificate" bosh.yml > mp2p_nsx_ca.cert
  sed -i '/^$/d' mp2p_nsx_ca.cert
  yq e -i '.iaas-configurations.[].additional_cloud_properties.nsxt.ca_cert= "'"$(< mp2p_nsx_ca.cert)"'"' bosh.yml

  yq -i ".iaas-configurations.[].nsx_t_use_policy_api=${use_policy_api}" bosh.yml

  echo "Configure bosh director"
  $omcli configure-director --config bosh.yml

  echo "Checking pending changes"
  $omcli pending-changes
  echo "Apply changes to update bosh director"
  $omcli apply-changes --skip-deploy-products

  rm mp2p_nsx_ca.cert
}

function verify_migration_mode() {
  migration_flag=$(bosh cpi-config | grep policy_api_migration_mode | head -n 1)
  policy_flag=$(bosh cpi-config | grep use_policy_api | head -n 1)

  case $1 in

    enable)
      if ! echo "$migration_flag" | grep -q true || ! echo $policy_flag | grep -q false
      then
        echo "Failed to enable Bosh migration mode"
        exit 1
      fi
      echo "Bosh migration mode enabled"
      ;;
    disable)
      if ! echo $migration_flag | grep -q false || ! echo $policy_flag | grep -q true
      then
        echo "Failed to disable Bosh migration mode and enable policy"
        exit 1
      fi
      echo "Bosh migration mode disabled and Policy mode enabled"
      ;;

    *)
      echo "Usage: $0 {enable|disable}"
      exit 1
      ;;

  esac
}

function main() {
  if (($#<4));then
    echo "Usage: $0 {enable|disable} <opsmanager_ip/fqdn> opsmanager_username opsmanager_password"
    exit 1
  fi

  # sanity check if bosh env exported, om, yq installed and executed
  bosh env > null
  yq help > null
  om version > null

  export OPS_MANAGER_URL="https://"$2
  export OPS_MANAGER_USERNAME=$3
  export OPS_MANAGER_PASSWORD=$4
  export omcli="om --target $OPS_MANAGER_URL --username $OPS_MANAGER_USERNAME --password $OPS_MANAGER_PASSWORD -k"

  case $1 in

    enable)
      # use policyapi=false, migrationmode=true
      config_bosh_migrate_mode false true
      verify_migration_mode enable
      ;;

    disable)
      # use policyapi=true, migrationmode=false
      config_bosh_migrate_mode true false
      verify_migration_mode disable
      ;;

    *)
      echo "Usage: $0 {enable|disable}"
      exit 1
      ;;

  esac
}

main $@