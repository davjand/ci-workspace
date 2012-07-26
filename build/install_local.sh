
### GIT MASTER INIT SCRIPT
#
# This script can be copied into the root of an empty repo and used to set everything up
# @author: David Anderson
# @date: 20-07-2012
#
###

#git remote add workspace git@github.com:davjand/sym-workspace
#git fetch workspace
#git merge workspace/master --no-edit

git submodule update --init

cp build/local/config.php public_html/manifest/config.php
php build/local/build-install.php

chmod -R 755 public_html 

chmod 644 public_html/.htaccess
chmod 644 public_html/manifest/config.php