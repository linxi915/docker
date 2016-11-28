#!python

import sys, os, subprocess

subprocess.call(os.environ['CATALINA_HOME'] + "/bin/catalina.sh run", shell=True)
