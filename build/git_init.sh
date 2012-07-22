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
#git fetch workspace public_html
#git merge workspace/master --no-edit

#
###


### Pull Symphony
#

#git remote add symphony git@github.com:symphonycms/symphony-2.git
#git fetch symphony public_html
#git merge symphony/master --no-edit

git clone git@github.com:symphonycms/symphony-2.git symphony
mv symphony/* public_html
rm -R -f symphony

#
###


### Re-add all symphony default extensions as can prevent errors
#
rm public_html/.gitmodules
touch public_html/.gitmodules

git rm --cached public_html/extensions/debugdevkit 
git rm --cached public_html/extensions/export_ensemble
git rm --cached public_html/extensions/jit_image_manipulation
git rm --cached public_html/extensions/maintenance_mode
git rm --cached public_html/extensions/markdown
git rm --cached public_html/extensions/profiledevkit
git rm --cached public_html/extensions/selectbox_link_field
git rm --cached public_html/extensions/xssfilter

rm -r public_html/extensions/debugdevkit 
rm -r public_html/extensions/export_ensemble
rm -r public_html/extensions/jit_image_manipulation
rm -r public_html/extensions/maintenance_mode
rm -r public_html/extensions/markdown
rm -r public_html/extensions/profiledevkit
rm -r public_html/extensions/selectbox_link_field
rm -r public_html/extensions/xssfilter

git submodule add git@github.com:symphonycms/debugdevkit.git public_html/extensions/debugdevkit --recursive
git submodule add git@github.com:symphonycms/export_ensemble.git public_html/extensions/export_ensemble --recursive
git submodule add git@github.com:symphonycms/jit_image_manipulation.git public_html/extensions/jit_image_manipulation --recursive
git submodule add git@github.com:symphonycms/maintenance_mode.git public_html/extensions/maintenance_mode --recursive
git submodule add git@github.com:symphonycms/markdown.git public_html/extensions/markdown --recursive
git submodule add git@github.com:symphonycms/profiledevkit.git public_html/extensions/profiledevkit --recursive
git submodule add git@github.com:symphonycms/selectbox_link_field.git public_html/extensions/selectbox_link_field --recursive
git submodule add git@github.com:symphonycms/xssfilter.git public_html/extensions/xssfilter --recursive
#
###

###Grab extensions
#

sh build/git_submodules.sh

#
###

### Init submodules
#

git submodule update --init

#
###

### FILE PERMISSIONS (NEEDS CHANGING AFTER INSTALL)
#
chmod -R 777 public_html 
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