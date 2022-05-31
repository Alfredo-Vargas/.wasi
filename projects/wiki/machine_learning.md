# Miniconda setup for virtual environments

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
```conda
conda env export --name ENVNAME > envname.yml
conda env create --file envname.yml
```
If a file named environment.yml is present in a directory you could create an environment by
```console
conda env create
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

# Python Virtual environments

## To create a virtual environment
Create a virtual environment named `venv_dir`, directory with the binaries:
```console
python -m venv <venv_dir>
```

## To activate your virtual environment in Linux
```console
source <venv_dir>/bin/activate
```

## To install and uninstall packages using `pip`
```console
pip install <package>
pip uninstall <package>
```

## To upgrade pip
```console
python -m pip install --upgrade pip
```

## To install and enable Jupyter  Themes
```console
pip install --upgrade jupyterthemes
```
## To list jupyter themes on terminal or in a notebook:
```console
jt -l
!jt -l
```
```console
pip install jupyter notebook
pip install jupyter_contrib_nbextensions
pip install jupyter_nbextensions_configurator
jupyter nbextensions_configurator enable --user
```
Check where is the directory that jupyter looks for extensions with:
```console
jupyter --data-dir
```
In my case was `~/.local/share/jupyter/`
```console
cd ~/.local/share/jupyter/
git clone <chosen extension>
```
Then launch `jupyter` and configure the extensions in Edit->Nbextensions

# Check GPU usage

```console
watch -n -1 nvidia-smi
```

## Configuration with `jupyterlab`
```console
pip install jupyterlab
pip install jupyterlab-lsp
```
Search for the themes `darcula` and vim plugins
