#! /bin/bash 

# Wait for AdminServer to become available for any subsequent operation
/u01/oracle/waitForAdminServer.sh

wlst /u01/oracle/my-scripts/app-deploy-servers.py

