### BUILD.SH
#
# This script should not be executed in this directory
# It is intended to be copied into the root directory of an already setup git repository
# (init and remote setup) in order to build everything that is needed 
#
# @author: David Anderson
# @date: 20-07-2012
#
###

git remote add workspace git@github.com:davjand/sym-workspace.git
git fetch workspace
git merge workspace/master --no-edit

sh build/init/git_init.sh