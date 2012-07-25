### GIT MASTER INIT SCRIPT
#
# This script can be copied into the root of an empty repo and used to set everything up
# @author: David Anderson
# @date: 20-07-2012
#
###

#git init
git remote add workspace git@github.com:davjand/sym-workspace
git pull workspace master
sh build/git_init.sh