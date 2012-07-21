### GIT INIT SCRIPT
#
# Sets up a new symphony project from scratch
# @author: David Anderson
# @date: 20-07-2012
#
###

#INITIAL - UNCOMMENT TO RUN AS A COMPLETE INSTALLER

git init
git remote add workspace git@github.com:davjand/sym-workspace.git
git fetch workspace
git merge workspace/master --no-edit

#####



#Pull Symphony
git remote add symphony git@github.com:symphonycms/symphony-2.git
git fetch workspace
git merge workspace/master --no-edit


#Sort out the git ignore from symphony
rm .gitignore
mv ./workspace.gitignore ./.gitignore


#grab extensions
#sh git_submodules.sh


#Init submodules
git submodule update --init


#REMOTE REPO SETUP
git remote add origin git@github.com:davjand/veo-website.git

git add -A
git commit -m "Initial Commit"
git push origin master