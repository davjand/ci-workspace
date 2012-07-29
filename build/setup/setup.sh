### SETUP.SH
#
# This script should not be executed in this directory
# It is intended to be copied into the root directory and run to setup a repo
#
# INSTALL PROCESS
#
# 1) Init GIT Repo in directory
# 2) Add remote origin
# 3) Copy build/setup/setup.sh into directory and run
# 4) Review build/setup/setup_extensions.sh and install selected extension
# 5) Visit /install on the local instance and complete the install process
#
# @author: David Anderson
# @date: 20-07-2012
#
###

git remote add workspace git@github.com:davjand/ci-workspace.git
git fetch workspace
git merge workspace/master --no-edit

git submodule update --init
git submodule foreach git pull origin master


#copy the install directory
cp -r build/install/ public_html/install/

#permission issues - ONLY TO BE USED LOCALLY

chmod -R 777 public_html/workspace/
chmod -R 777 public_html/manifest/
chmod -R 777 public_html/install/
chmod  777 public_html/