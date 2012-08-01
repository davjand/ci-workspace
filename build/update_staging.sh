### UPDATE_STATING.SH
#
# Used to update the repository on the  staging server
#
# INSTALL STEPS
#
# 1) Setup a symphony user that can login via token. Copy the token into the script below
# 2) Replace "yourwebsite.com" with your symphony website
# 3) This script can be called from an external CI system to update the codebase
#
# You will need ssh key setup etc
# 
# @author: David Anderson
# @date: 01-08-2012
#
###

#Pull the latest and force a merge (incase tracked files have accumulated)
git fetch origin
git merge origin/master --quiet

##Update Submodules
git submodule update --init

#install any updates via curl
curl -c curl_cookie.txt -s http://yourwebsite.com/symphony/login/TOKEN/
curl -b curl_cookie.txt -s http://yourwebsite.com/symphony/extension/database_migrations/?action=update

#remove the cookie file
rm curl_cookie.txt 
