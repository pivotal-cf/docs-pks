---
title: Viewing Cluster Plans

---

This topic describes how to use the {{  vars.product_full }} Command Line Interface ({{ vars.product_short }} CLI) to view information about the plans available for deploying a {{ vars.product_short }} cluster.

1. {{> login-api }}


1. Run the following command to view information about the available plans for deploying a cluster:

    ```
    $ tkgi plans
    ```

    The response lists details about the available plans, including plan names and descriptions:
    ```console
    $ tkgi plans

    Name     ID  Description
    default      Default plan for K8s cluster
    ```
