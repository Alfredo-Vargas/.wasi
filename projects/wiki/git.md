# To clone, checkout and use custom directory
```console
git clone <github-repo> -b <branch-name> <custom-directory>
```
# Stage and unstage
```
console
git add -u
git reset
```

# See all branches
```console
git branch -a
```

# To list branches and change to branch
```console
git branch
git checkout <branch>
```

# Create and move to branch
```console
git checkout -b <stage>
```

# To push to remote
```console
git push origin <stage>
```

# To add submodule
Within the main repo to another repo as submodule:
```console
git submodule add git@github.com:Alfredo-Vargas/wordle-test.git
```
By default any push or pull request will ignore this submodule
To pull the submodules use:
```console
git pull --recurse-submodules
```
or after pull or clone update the submodule 
```console
git submodule update --init
```
or add the recursive module flag to it as follows
```console
git config submodule.recurse true
```

# To download a directory from a Github:
Navigate to the URL [DownGit](https://downgit.github.io/#/home)
