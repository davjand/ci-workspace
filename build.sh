### BUILD.SH
#
# This script should not be executed in this directory
# It is intended to be copied into the root directory and run
#
# @author: David Anderson
# @date: 20-07-2012
#
###

git init
git remote add workspace git@github.com:davjand/sym-workspace.git
git fetch workspace
git merge workspace/master --no-edit

sh build/init/init.sh