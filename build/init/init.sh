### GIT INIT SCRIPT
#
# Sets up a new symphony project from scratch
# @author: David Anderson
# @date: 20-07-2012
#
###

### Pull Symphony
#

git clone git@github.com:symphonycms/symphony-2.git symphony
mv symphony/* public_html
rm -R -f symphony

#
###

### FILE PERMISSIONS (NEEDS CHANGING AFTER INSTALL)
#
chmod -R 777 public_html 
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

###Grab the needed extensions
#

git submodule add git@github.com:davjand/database-migrations.git public_html/extensions/database_migrations --recursive
git submodule add git@github.com:nickdunn/symql.git public_html/extensions/symql --recursive
git submodule add git@github.com:vlad-ghita/limit_section_entries.git public_html/extensions/limit_section_entries --recursive

#
###

### Init submodules
#

git submodule update --init

#
###

### Commit
#

git add -A
git commit -m "Initial Commit"

#
###