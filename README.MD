CI Workspace
====

> git@github.com:davjand/ci-workspace
>
> @author: David Anderson
> @date: 29/07/2012 
> @version: 0.2
>


Overview
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

Requirements
------------

 * Database migrations extension (davjand/database-migrations)
 * A git repository
 * Two server domains (for staging and testing)
 * (Optional) A


Setup & Workflow
================

The following are the different cases of using the system

1. Initial Setup for a new site
2. Setup of a 'second' local developer
3. Migrate changes between local installs
4. Setup of a 'remote' staging server
5. Updating a 'remote' staging server
6. Setup of a 'remote' live server
7. Release of a new live version to the live server


(1) Initial Setup of a new site
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


(2) Setup of a second local developer
-------------------------------------

This assumes that you have a second machine from which you want to work on the project on with git fully setup.

1. Setup a local server (ie XAMPP)
2. Create a git repository that is accessible via localhost (git init)
3. Add your origin remote (git remote add origin git@github.com:your-name/repo-name)
4. Pull your repository from origin (git pull origin master)
5. Run the install script (sh build/install.sh)
6. Open your browsers to the public_html/install directory 
7. Run the symphony installation wizard and remove the install directory
8. Commit your initial site to your repository (git add -A, git commit -m "Initial Commit", git push origin master)

You're now setup with a fully tracked repository that will migrate database changes.


(3) Migrate changes between local installs
-------------------------------------------

A developer has made changes to a repository or database on a different machine and pushed to git

1. Pull changes from git / update any submodules
2. Load up any symphony page to initiate a database upgrade


