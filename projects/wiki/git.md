# Some Git Commands
- `git commit -a` : Stages files automatically
- `git log -p` : Produces patch text
- `git show <commitID>` : Shows various objects
- `git diff` : Is similar to the Linux `diff` command, and can show the differences in various commits
- `git diff --staged` : An alias to --cached, this will show all staged files compared to the named commit
- `git add -p` : Allows a user to interactively review patches to add to the current commit
- `git git mv` : Similar to the Linux `mv` command, this moves a file
- `git rm` : Similar to the Linux `rm` command, this deletes, or removes a file
- `git show <commitID>` : To show an specific commit
- `git -a -m <mesage>` : To add and commit in the same step:
- `git config -l` : Check the current git configuration
- `git clone <github-repo> -b <branch-name> <custom-directory>` : To clone, checkout and use custom directory
- `git add -u` and `git reset` : Stage and unstage
- `git branch -a` : see all branches
- `git branch` and `git checkout <branch>` : To list branches and change to branch
- `git checkout -b <stage>` : Create and move to branch
- `git push origin <stage>` : to push to remote
- `git submodule add git@github.com:Alfredo-Vargas/wordle-test.git` : to add sub-module within the main repo to another repo
- `git pull --recursive-submodules` : by default any push or pull will ignore the sub-modules
- `git submodule update --init` : after pull or clone update the sub-module 
- `git config submodule.recurse true` : add the recursive module flag to it as follows
- `git commit --amend` : allow us to modify and add changes to the most recent commit
- `git revert HEAD` : creates a new commit with the latest reversed changes
- `git revert <commitID>` : 

# Some notes
- The hash of the commits IDs are obtained using `SHA1`
- To download a directory from a Github, then navigate to the URL [Download Git Directory](https://downgit.github.io/-/home)
