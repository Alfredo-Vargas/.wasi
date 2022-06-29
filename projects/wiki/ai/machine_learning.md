# Fashion-MINST with tensorflow and callbacks
```python
import tensorflow as tf
print(tf.__version__)

class myCallback(tf.keras.callbacks.Callback):
  def on_epoch_end(self, epoch, logs={}):
    if(logs.get('loss')<0.15):
      print("Reached 95% accuracy so cancelling training!")
      self.model.stop_training = True

callbacks = myCallback()
mnist = tf.keras.datasets.fashion_mnist
(training_images, training_labels), (test_images, test_labels) = mnist.load_data()
training_images=training_images/255.0
test_images=test_images/255.0
model = tf.keras.models.Sequential([
  tf.keras.layers.Flatten(),
  tf.keras.layers.Dense(512, activation=tf.nn.relu),
  tf.keras.layers.Dense(10, activation=tf.nn.softmax)
])
model.compile(optimizer='adam', loss='sparse_categorical_crossentropy', metrics= ['accuracy'])
model.fit(training_images, training_labels, epochs=30, callbacks=[callbacks])
```

# Numa node availability
- **numa** stands for _Non-Uniform Memory Access__(NUMA). It refers to multiprocessor systems whose memory is divided into multiple memory nodes. The access time of a memory node depends on the relative locations of the accessing CPU and the accessed node.
- Sometimes one will get the following warnings:
```console
I tensorflow/stream_executor/cuda/cuda_gpu_executor.cc:975] successful NUMA node read from SysFS had negative value (-1), but there must be at least one NUMA node, so returning NUMA node zero
```
- NUMA is a method of configuring a cluster of microprocessor in a multiprocessing system so that they can share memory locally, improving performance and the ability of the system to be expanded. NUMA is used in a symmetric multiprocessing (SMP) system.
- So we need to change its value from -1 to 0. For that we use the following script:
```bash
for a in /sys/bus/pci/devices/*; do echo 0 | sudo tee -a $a/numa_node; done
```

# Configuration with `jupyterlab`
```bash
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
