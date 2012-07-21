### GIT INIT SCRIPT
#
# Sets up a new symphony project from scratch
# @author: David Anderson
# @date: 20-07-2012
#
###

### INITIAL - UNCOMMENT TO RUN AS A COMPLETE INSTALLER
#

#git init
#git remote add workspace git@github.com:davjand/sym-workspace.git
#git fetch workspace
#git merge workspace/master --no-edit

#
###


### Pull Symphony
#

git remote add symphony git@github.com:symphonycms/symphony-2.git
git fetch symphony
git merge symphony/master --no-edit
git submodule update --init
#
###


### Re-add all symphony default extensions as can prevent errors
#
rm .gitmodules
touch .gitmodules

git rm --cached extensions/debugdevkit 
git rm --cached extensions/export_ensemble
git rm --cached extensions/jit_image_manipulation
git rm --cached extensions/maintenance_mode
git rm --cached extensions/markdown
git rm --cached extensions/profiledevkit
git rm --cached extensions/selectbox_link_field
git rm --cached extensions/xssfilter

rm -r extensions/debugdevkit 
rm -r extensions/export_ensemble
rm -r extensions/jit_image_manipulation
rm -r extensions/maintenance_mode
rm -r extensions/markdown
rm -r extensions/profiledevkit
rm -r extensions/selectbox_link_field
rm -r extensions/xssfilter

git submodule add git@github.com:symphonycms/debugdevkit.git extensions/debugdevkit --recursive
git submodule add git@github.com:symphonycms/export_ensemble.git extensions/export_ensemble --recursive
git submodule add git@github.com:symphonycms/jit_image_manipulation.git extensions/jit_image_manipulation --recursive
git submodule add git@github.com:symphonycms/maintenance_mode.git extensions/maintenance_mode --recursive
git submodule add git@github.com:symphonycms/markdown.git extensions/markdown --recursive
git submodule add git@github.com:symphonycms/profiledevkit.git extensions/profiledevkit --recursive
git submodule add git@github.com:symphonycms/selectbox_link_field.git extensions/selectbox_link_field --recursive
git submodule add git@github.com:symphonycms/xssfilter.git extensions/xssfilter --recursive
#
###


### Sort out the git ignore from symphony
#

rm .gitignore
mv ./workspace.gitignore ./.gitignore

#
###

###Grab extensions
#

sh git_submodules.sh

#
###

### Init submodules
#

git submodule update --init

#
###

### FILE PERMISSIONS (NEEDS CHANGING AFTER INSTALL)
#
chmod -R 777 . 
#
###

### REMOTE REPO SETUP
#

git add -A
git commit -m "Initial Commit"

#git remote add origin git@github.com:davjand/ {INSERT REPO} .git
#git push origin master

#
###