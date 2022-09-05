# Miniconda Cheat Sheet

## Basic Recipe to create a conda virtual environment

```console
conda create -n <my-env> -c conda-forge python jupyerlab numpy matplotlib
conda create -n <my-env> -c conda-forge python jupyerlab matplotlib pandas scikit-learn
conda create -n <my-env> -c conda-forge python jupyerlab matplotlib pandas tensorflow
```

- `conda install -c conda-forge jupyterthemes` : seems that is not working.
- Nice `onedarkpro` theme can be found [here](https://github.com/johnnybarrels/jupyterlab_onedarkpro)

## Plugins to Jupyterlab

```console
conda install -c conda-forge theme-darcula jupyerlab_vim jupyerlab-lsp jedi-language-server
```
- `conda install -c conda-forge python-lsp-server` : seems an alternative to jedi-language-server

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

- Two options to create a `conda` environment:

```console
conda create --name <venv-name>
conda create -n <venv-name>
```

- To create a `conda` environment and then installing a package through a particular channel use:

```console
conda create -n <venv-name> -c <channel-name> <package-name>
```

- An example of channel name is: `conda-forge` and package name is `scikit-learn`. Conda-forge is maintained by the maintainers of the packages themselves, while the main channel is maintained by Anaconda.

## To manipulate conda channels

```console
conda config --show channels
conda config --add channels <some-channel>
```

- To give an added channel priority, append it to the top of the list and to remove it

```console
conda config --append channels <some-channel>
conda config --remove channels <some-channel>
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
