### INSTALL_STATING.SH
#
# Used to install the repository onto a staging server
#
# INSTALL STEPS
#
# 1) Pull repository to server
# 2) Run build/install_staging.sh
# 3) Visit /install on the server to complete the process
#
# You will probable need to setup ssh keys for github as well
# 
# @author: David Anderson
# @date: 01-08-2012
#
###

###MAY NEED CHANGING

git submodule update --init
git submodule foreach git pull origin master

#copy the install directory
cp -r build/install/ public_html/install/


#permission setup - needed for install, symphony 'should' sort out after
chmod -R 755 public_html/workspace/
chmod -R 755 public_html/manifest/
chmod -R 755 public_html/install/
chmod  755 public_html/
chmod -R 755 data/
