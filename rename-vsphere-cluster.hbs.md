# Updating TKGi and BOSH After Renaming a vSphere Cluster

Renaming a vSphere cluster where {{ vars.product_full }} (TKGi) is deployed involves several steps due to how BOSH manages its deployments. Initially, the cluster must be renamed within vSphere. Since {{ vars.platform_name }} does not permit direct editing of existing Availability Zones (AZs), the `installation.yml` file on the {{ vars.platform_name }} VM must be decrypted, edited to reflect the new cluster name, and then re-encrypted. This modification allows BOSH to recognize the cluster name change as a property update. Upon the next application of changes, all virtual machines within that deployment, including the BOSH Director VM if it resides on the renamed cluster, will undergo a complete drain, stop, and start cycle. Following these steps, the system is expected to function as anticipated.

1. Login to the Jumper, then get the public key for ops man and save it to a file. Example file name “ops-key”

2. Change the file permission.

    ```
    chmod 600 ops-key
    ```

3. SSH to the ops-man VM.

    ```
    ssh ubuntu@88.0.0.5 \-i ops-key
    ```

Followed the steps as given in this KB article for editing the installation.yml
	[https://knowledge.broadcom.com/external/article?articleId=293641](https://knowledge.broadcom.com/external/article?articleId=293641)

4. Change directory to

    ```
    cd /tmp/
    ```

5. Decrypt the installation.yml and copy to /tmp

    ```
    sudo \-u tempest-web SECRET\_KEY\_BASE="s" RAILS\_ENV=production /home/tempest-web/tempest/web/scripts/decrypt /var/tempest/workspaces/default/installation.yml /tmp/installation.yml
    ```

6. When prompted, enter the Decryption Passphrase which is the password of the {{ vars.platform_name }} login.

7. Take a backup:

    ```
    sudo cp /tmp/installation.yml \~/installation-cp.yml
    ```

8. SCP the file to local server for editing or you can also edit directly using vi

9. Rename the file in /tmp if you are going to use SCP or leave the name as it as if you edit the file directly with vi.

    ```
    sudo mv installation.yml installation-orig.yml
    ```

10. SCP syntax example for transferring the file.

    ```
    scp installation.yml [sreeram@10.159.151.181:/home/sreeram/bosh\_w/](mailto:sreeram@10.159.151.181:/home/sreeram/bosh_w/)
    ```

11. Edit the cluster name in installation.yml.

You should usually see 4 below 4 lines where the cluster name needs to be updated.

![][image1]

12. Transfer it back to the Jumper and then to the {{ vars.platform_name }}.

    ```
    scp \-i /home/kubo/ops-key installation.yml [ubuntu@88.0.0.5:/tmp/](mailto:ubuntu@88.0.0.5:/tmp/)
    ```

13. From Jumper machine, check the current list of BOSH tasks and note down the last task ID. Here in this example the last task ID is 116\.

    ```
    bosh tasks \-r=1000 \-a (or) watch \-n 5 bosh tasks \--recent \-a
    ```

![before\_apply\_changes\_ops\_man][image2]

14. Login to the vCenter and rename the Cluster name as updated in installation.yml.

15. Encrypt back the file to the {{ vars.platform_name }}:

    ```
    sudo \-u tempest-web SECRET\_KEY\_BASE="s" RAILS\_ENV=production /home/tempest-web/tempest/web/scripts/encrypt /tmp/installation.yml /var/tempest/workspaces/default/installation.yml
    ```

16. After this you should see the updated Cluster name in the Bosh tile availability zone but the changes are not yet applied.

17. Plan for a maintenance widow and apply changes.

18. Review pending changes and Apply changes

![][image3]

![][image4]

19. You could notice similar tasks as given below after the changes are applied. Bosh will be down when this happens with the previous command “watch \-n 5 bosh tasks \--recent \-a”

![post\_upgrade\_task-List][image5]

20. Ops man Change log could be having similar entries.

	![Ops\_man\_change\_log][image6]

21. The changes could take an hour. The renamed Cluster should now be accessible.