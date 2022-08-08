# Some Git Commands
- `git rm -r --cached .` : clean the cache whenever are untracked files
- `git log -p` : Produces patch text
- `git diff` : Is similar to the Linux `diff` command, and can show the differences in various commits
- `git add -p` : Allows a user to interactively review patches to add to the current commit
- `git config -l` : Check the current git configuration

## Cloning
- `git clone <github-repo>` : To clone a given repo
- `git clone <github-repo> -b <branch-name> <custom-directory>` : To clone, checkout and use custom directory

## Staging
- `git add -u` : to stage 
- `git reset` : to unstage
- `git diff --staged` : An alias to --cached, this will show all staged files compared to the named commit

## File Editions
- `git git mv` : Similar to the Linux `mv` command, this moves a file
- `git rm` : Similar to the Linux `rm` command, this deletes, or removes a file
- `git checkout <filename>` : to restore a modified file back to the latest commit

## Commits
- `git commit -a` : Stages files automatically
- `git commit --amend` : allow us to modify and add changes to the most recent commit
- `git show <commitID>` : To show an specific commit
- `git -a -m <mesage>` : To add and commit in the same step:

## Branching
- `git branch <new-branch-name>` : to create a branch
- `git branch -a` : see all branches
- `git branch` and `git checkout <branch>` : To list branches and change to branch
- `git checkout -b <new-branch>` : Create and move to branch, the current branch is restore to the latest commit
- `git push origin <stage>` : to push to remote
- `git branch -d <branch-name>` : the given branch is deleted
- `git branch -D <branch-name>` : forcibly deletes the given branch

## Sub-modules
- `git submodule add git@github.com:Alfredo-Vargas/wordle-test.git` : to add sub-module within the main repo to another repo
- `git pull --recursive-submodules` : by default any push or pull will ignore the sub-modules
- `git submodule update --init` : after pull or clone update the sub-module 
- `git config submodule.recurse true` : add the recursive module flag to it as follows

## Reverting Commits
- `git revert HEAD` : creates a new commit with the latest reversed changes
- `git revert <commitID>` : 

## Merging
- There are two algorithms for merging: **Forward Merge** and **Three-way merge**
- `git merge <another-branch>` : to merge our current branch to another-branch. Then both branches are pointed to the same commit
- When merging conflicts occur manually delete the extra chars on every conflict file and resolve manually the conflicts. Then use git add.
- `git merge --abort` : will stop the merge and reset the files to the previous commit before any merge ever happened
- `git log --graph or git log --graph --oneline` : to visualize the merging of branches

## Remote Repository
- `git branch -M main` : to set the branch name as main
- `git push -u origin 'main'` : to push the branch main to the remote repo
- By default the remote repository has the name **origin**
- `git remote -v` : shows the remote repositories for fetch and push (they **can** used HTTP and HTTPS respectively)
- `git remote show origin` : show the remote repository details
- `git branch -r` : show the branches of the remote repository
- `git push --delete origin <remote-branch-name>` : removes a remote branch

## Rebase
- Allows to change the base commit of a branch on a three-way merge situation and changing it linear so now a Forward Merge takes place. _This overwrites the commit history!_
- `git rebase <new-base-branch>` : to rebase a branch
- `git rebase origin/master` : to rebase our local changes and keep history linear (done after `git fetch`)
- `git rebase --continue` : after manually resolving conflicts to continue the rebase process

# Some notes
- A branch is a pointer to a particular commit. Represents an independent line of development in a project
- The hash of the commits IDs are obtained using `SHA1`
- To download a directory from a Github, then navigate to the URL [Download Git Directory](https://downgit.github.io/-/home)
