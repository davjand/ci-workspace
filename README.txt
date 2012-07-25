# git@github.com:davjand/ci-workspace
#
#A workspace to allow continuous integration with symphony.
#
# @author: David Anderson
# @date: 25/07/2012 
# @version: 0.1
#


Setup Instructions:
=====

The setup procedure for this isn't perfectly setup yet so what you must do.

1) Pull from the repository
2) Edit build/local/config.php so that the database settings are correct for your local install

3) Edit build/local/htaccess.txt so that you remove <!-- BASE DIRECTORY --> and replace it with the correct base directory for the server.
 - For example:
 - If you were running it at localhost/sites/mysite
 - It would need to be /sites/mysite/public_html
 - NOTE: You need the public_html on the end.
 
4) Run sh build/install_local.sh this will move things to the correct place and install the database.

5) You can now login with the credentials admin & admin
 
 
 This is just the start of the workflow being developed.
 
 @TODO: More detail instructions