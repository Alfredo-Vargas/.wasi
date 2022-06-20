# Configuration with `jupyterlab`
```console
pip install jupyterlab
pip install jupyterlab-lsp
```
Search for the themes `darcula` and vim plugins (`jupyterlab_vim`)

# Python Virtual environments
Whenever possible prefer to create a conda virtual environment rather than python virtual one.

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

# To install and enable Jupyter  Themes
Whenever possible use jupyter lab rather than jupyter notebook.
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
- Check where is the directory that jupyter looks for extensions with:
```console
jupyter --data-dir
```
- In my case was `~/.local/share/jupyter/`
```console
cd ~/.local/share/jupyter/
git clone <chosen extension>
```
- Then launch `jupyter` and configure the extensions in Edit->Nbextensions
