### INSTALL.SH
#
# Used to install the repository after a pull to a NEW local server
#
# INSTALL STEPS
#
# 1) Pull repository to server
# 2) Run build/install.sh
# 3) Visit /install on the server to complete the process
# 
# @author: David Anderson
# @date: 20-07-2012
#
###

git submodule update --init

#copy the install directory
cp build/install/* public_html/install/*

#permission issues - ONLY TO BE USED LOCALLY

chmod -R 777 public_html/workspace/
chmod -R 777 public_html/manifest/
chmod -R 777 public_html/.htaccess
