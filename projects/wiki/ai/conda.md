
# Miniconda Cheat Sheet

## Verify installation and update conda to current version
```console
conda info
conda update -n base conda
```
## Alternatively update packages to latest version of anaconda (stable, not necessarily the latest)
```console
conda update anaconda
```

## To create a virtual environment
```console
conda create --name <venv-name>
```

## To list environments installed
```console
conda env list
```

## To activate and deactivate virtual environments
```console
conda activate <venv-name>
conda deactivate
```

## To check installed packages for a particular environment
```console
conda list
conda list --name <venv-name>
```

## To clone an environment
```
conda create --clone <venv-name> --name <new-venv>
```

## Export and create an environment from a yaml file
```console
conda env export --name ENVNAME > envname.yml
conda env create --file envname.yml
```
If a file named environment.yml is present in a directory you could create an environment by
```console
conda env create
```

## To NOT activate conda by default
```console
conda config --set auto_activate_base false
```

## To install conda packages (make sure virtual environment is activated)
Any conda package for example `python=3.9`
```console
conda install <package-name>
```

## To delete an environment
```console
conda remove --name <venv-name> --all
```

## To remove a specific package
```console
conda remove --name <venv-name> <packname1> <packagename2> ...
```
