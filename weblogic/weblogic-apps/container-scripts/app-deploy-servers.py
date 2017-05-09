import os
import re


def check_file_or_dir_exists(path):
    return os.path.isdir(path) or os.path.exists(path)


# Deployment Information 
app_name = os.environ.get('APP_NAME', 'app')
app_pkg = os.environ.get('APP_PKG_FILE', 'app/sample.war')
app_dir = os.environ.get('APP_PKG_LOCATION', '/u01/oracle')
app_stage_mode = os.environ.get('APP_STAGE_MODE', 'stage')
app_upload =  os.environ.get('APP_UPLOAD', 'True')
cluster_name = os.environ.get("CLUSTER_NAME", "DockerCluster")
source_path = app_dir + '/' + app_pkg

if app_stage_mode == 'external_stage' or check_file_or_dir_exists(source_path):
    execfile('/u01/oracle/commonfuncs.py')
    connectToAdmin()
    appList = re.findall(app_name, ls('/AppDeployments'))

    if len(appList) >= 1:
        print "undeploying application %s " % cluster_name
        undeploy(app_name, targets=cluster_name)

    deploy(app_name, path=source_path, targets=cluster_name, stageMode=app_stage_mode, timeout=0, upload=app_upload)
    disconnect()
else:
    print ">>>> Error : App not existed %s" % source_path

exit()

