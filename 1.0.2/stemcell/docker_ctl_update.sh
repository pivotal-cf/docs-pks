#! /bin/bash
set -ex

for deployment in $(bosh deployments --json | jq '.Tables[0] | .Rows | .[] | select(.release_s | contains ("docker/30.1.4")) | .name' | grep service-instance ); do
    bosh -d "${deployment}" scp docker_ctl worker:/tmp; bosh -d "${deployment}" ssh worker --command="sudo mv -f /tmp/docker_ctl /var/vcap/jobs/docker/bin/ctl; sudo chown root:vcap /var/vcap/jobs/docker/bin/ctl; sudo chmod +x /var/vcap/jobs/docker/bin/ctl";
done
