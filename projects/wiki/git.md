# Some Git Commands
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
## Sub-modules
- `git submodule add git@github.com:Alfredo-Vargas/wordle-test.git` : to add sub-module within the main repo to another repo
- `git pull --recursive-submodules` : by default any push or pull will ignore the sub-modules
- `git submodule update --init` : after pull or clone update the sub-module 
- `git config submodule.recurse true` : add the recursive module flag to it as follows
## Reverting Commits
- `git revert HEAD` : creates a new commit with the latest reversed changes
- `git revert <commitID>` : 

# Some notes
- A branch is a pointer to a particular commit. Represents an independent line of development in a project
- The hash of the commits IDs are obtained using `SHA1`
- To download a directory from a Github, then navigate to the URL [Download Git Directory](https://downgit.github.io/-/home)
