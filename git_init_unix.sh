### GIT INIT SCRIPT
#
# Sets up a new symphony project from scratch
# @author: David Anderson
# @date: 20-07-2012
#
###

git init

#Pull Workspace (Only if not in workspace!)
git remote add workspace git@github.com:davjand/sym-workspace.git
git fetch workspace master

#Pull Symphony
git remote add symphony git@github.com:symphonycms/symphony-2
git fetch symphony master


#grab extensions
#sh git_submodules.sh

#Init submodules
git submodule update --init


#Sort out the git ignore from symphony
rm .gitignore
mv ./workspace.gitignore ./.gitignore