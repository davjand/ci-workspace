CI Workspace
====

> git@github.com:davjand/ci-workspace
>
> @author: David Anderson
> @date: 01/08/2012 
> @version: 0.2
>


#Overview
========

The Continuous Integration (CI) Workspace is designed to allow automation of common migration tasks within symphony with the goal of achieving a continuous-integrated project.

Most of this workflow can be utilised without the continuous integration server, most of the steps can be initiated manually giving you the same benefits with less automation.

This is designed with the following architecture:

 * The source code is entirely managed via github
 * Each developer develops on their own local install of symphony
 * There is a 'staging' server in which user based and content testing occurs
 * There is a 'live' server in which the website runs and live data is stored in the database
 * There is a continuous integration server that initiates the migration of code
 * (IN PROGRESS) There is a continuous integration server that unit tests the code.

The workflow is summarised as below:

 * Developers work on a local install and commit their code to github
 * The continuous integration server thus monitors the git repository and migrates changes that pass the unit tests to the staging server
 * These changes can then be 'pushed' to the live server when required (ideally weekly)

##Requirements
------------

 * Database migrations extension (davjand/database-migrations)
 * A git repository
 * Two server domains (for staging and testing)
 * (Optional) A


#Setup & Workflow
================

The following are the different cases of using the system

1. Initial Setup for a new site
2. Setup of a 'second' local developer
3. Migrate changes between local installs
4. Setup of a 'remote' staging server
5. Updating a 'remote' staging server
6. Setup of a 'remote' live server
7. Release of a new live version to the live server


##(1) Initial Setup of a new site
-------------------------------

1. Setup a local server (ie XAMPP)
2. Create a git repository that is accessible via localhost (git init)
3. Add your origin remote (git remote add origin git@github.com:your-name/repo-name)
4. Download the setup.sh file (build/setup/setup.sh) to the root of your git repository and run (sh setup.sh)
5. (Optional) Open setup_extensions.sh in a text editor and uncomment any desired extensions oradd your own
6. (Optional) Run setup_extensions.sh (sh build/setup/setup_extensions.sh)
7. Open your browsers to the public_html/install directory 
7. Run the symphony installation wizard and remove the install directory
8. Commit your initial site to your repository (git add -A, git commit -m "Initial Commit", git push origin master)

You're now setup with a fully tracked repository that will migrate database changes.


##(2) Setup of a second local developer
-------------------------------------

This assumes that you have a second machine from which you want to work on the project on with git fully setup.

1. Setup a local server (ie XAMPP)
2. Create a git repository that is accessible via localhost (git init)
3. Add your origin remote (git remote add origin git@github.com:your-name/repo-name)
4. Pull your repository from origin (git pull origin master)
5. Run the install script (sh build/install_local.sh)
6. Open your browsers to the public_html/install directory 
7. Run the symphony installation wizard and remove the install directory
8. Commit your initial site to your repository (git add -A, git commit -m "Initial Commit", git push origin master)

You're now setup with a fully tracked repository that will migrate database changes.


##(3) Migrate changes between local installs
-------------------------------------------

A developer has made changes to a repository or database on a different machine and pushed to git

1. Pull changes from git / update any submodules
2. Load up any symphony page to initiate a database upgrade


##(4) Setup of a remote staging server
------------------------------------

For this to work it, you will need the following: SSH access to the server and access to git & curl on the server.

You need to do the following:

1. Setup SSH Keys
2. Setup git and run the install scripts.

###Setting up the ssh keys

Please see [this github article for setup options](https://help.github.com/articles/managing-deploy-keys). My workflow is with a github dummy account. I add the ssh keys to this and add the account as a collaborator to the account

1. SSH to your server
2. Change to the ssh key directory (cd ~/.ssh)
3. Generate a key (/usr/bin/ssh-keygen -t rsa -C "your_email@youremail.com")
4. Hit enter to use the default file and leave the passcode blank. Yes this does make things more vulnerable but it is an absolute pain otherwise. Provided the private key stays on the server and nowhere else, you'll be fine.
5. Login via ftp or similar and open your public key file (probably at .ssh/id_rsa.pub)
6. Paste this into you ssh keys on github

###Setting up git & installing

The repository is setup such that it contains public_html as a subdirectory. Because of this you need to delete all files from your server that you don't need (including the existing public_html directory. Any that you can't delete should be added to the .gitignore file so that they don't get added into the repository and cause you issues.

1. SSH to your server
2. Initialise git in your home directory (/usr/bin/git init)
3. Add your remote (/usr/bin/git remote add origin git@github.com:your_name/your_repo
4. Pull the remote (/usr/bin/git pull origin master)
5. Run the install script (sh build/install_staging.sh)
6. Load the website up in your browser to complete the symphony install process
6. Login to your site and you'll be prompted to update the  database (if you've made changes) and to remove the install directory, do both of these!

Now you're setup!


