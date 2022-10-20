# Generalities

## Gathering Information

- Check kernel, architecture and type of System

```bash
uname -a
```

- Check OS distro release name

```bash
cat /etc/os-release
```

- Check file information, compiled binaries are ELF 64-bit.

```bash
file <filename>
```

## Exit Status in Linux

- The environment variable `$?` return the exit status of the last command which can return:
  - `0` when everything is OK
  - `1` when an error occurred

## Control Signals

- `C-s` : will suspend the process
- `C-q` : will resume the process
- `C-c` : stop process - sends an interrupt signal

## Process Search

- Use pager and search to find a process that contains `string` in its name

```bash
pstree | $PAGER
/string
```

## SSH Fundamentals

- Execute commands thorugh SSH via port forwarding.
  - The flag `-N` indicates to not execute remote command.
  - The flag `-L` is used with port forwarding.
- Example any network request from your current system `1234` will be forwarded to `localhost:1234` on the remote system

```bash
ssh -NL 1234:localhost:1234 username@xx.xx.xx.xx
```

- To do the same as above but specifying a ssh private key:

```bash
ssh -NL 1234:localhost:1234 -i /path/to/private_key
```

## SSH Access to a remote Jupyter Lab server

- First ssh into the server:

```bash
ssh username@<remote-host>
```

- Start jupyter lab on the remote server without an interface in a given port:

```bash
jupyter lab --no-browser --port <port-number>
```

- From the Local Computer establish port forwarding:

```bash
jupyter lab --no-browser --port <port-number>
```

- Access the `URL` from your local web browser

```bash
http://localhost:<local-port>
```

- On the server list the server URLs with their respective tokens:

```bash
jupyter server list
```

- Authenticate using the given token.

### Notes

1. The terminal running Jupyter Lab in the remote system has to be kept open. Alternatively one could run Jupyter Lab on the background
2. The terminal forwarding the port (ssh session) has to be kept open during the whole operation
3. The port forwarding terminal will not generate any output message to prompt that operation was successful (due to the `-N` flag)

## SSH Server

- `/etc/ssh/sshd_config` : is the ssh configuration file of the ssh service
- `sshd -t` : to restart the service to ensure a clean start, _valid configurations produce no output_
- `/etc/services` : to check the port numbers currently assigned on the server. Change the default $22$ for another one e.g. $34666$
- `sudo systemctl status sshd|ssh.service` : to check the last login attempts

## Log SSH

- `journalctl -u sshd | tail -n 100` : to log the `sshd` activities
- Examples of failed login attempts:
  1. `Jul 20 15:19:45 remotehostname sshd[8988]: Unable to negotiate with <IP> port <PORT>: no matching host key type found. Their offer: ssh-rsa,ssh-dss [preauth]`
  - Whenever an attempt is tried through a wrong port
  2. `Jul 20 15:23:46 remotehostname sshd[9421]: Connection reset by authenticating user trexuser <IP> port <PORT> [preauth]`
  - Whenever the user and port matched but authentication failed
- Examples of successful logins
  1. `Jul 20 15:38:50 remotehostname sshd[10292]: Accepted publickey for flyinguser from 192.168.1.12 port 39754 ssh2: <ENCRYPTTYPE>:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX`
  2. `Accepted publickey for <username> from <given_ip_address> port <PORT> ssh2:<ENCRYPTTYPE>:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX`

# Printer Installation on Arc with KDE Plasma

- Source of this instructions are from: [cups arch wiki](https://wiki.archlinux.org/title/CUPS)
- First you need to install.

```bash
sudo pacman -S cups
sudo systemctl enable cups
sudo systemctl start cups
```

You can optionally also install `cups-pdf` (optionally)

- Now check if you detect your `usb` connected printer is recognized by your system. For this use the command `lsusb` to list all USB devices current recognized. The `lsusb` can be installed by:

```bash
sudo pacman -S usbutils
```

- Once the printer is recognized you need to install the printers' drivers. Particularly for Canon those are part of the Gutenprint project. The drivers from the project that need to be installed are:

```bash
sudo pacman -S gutenprint
sudo pacman -S foomatic-db-gutenprint-ppds
```

- Then navigate to `localhost:631` to confirm the installation.
- At this point if there were other printers, it is a good idea to run:

```bash
sudo cups-genppupdate
sudo systemctl restart cups.service
```

- Install the kde printer utility and click add new printer.

# Check if a binary has library dependency

PAM stands for Linux Pluggable Authentication Modules which is a suite of libraries that allows a Linux system administrator to configure methods to authenticate users.

```bash
ldd <binary_location> | grep <library_name>
ldd /usr/bin/sddm | grep libpam.so
```

# Update fonts on system

```bash
fc-cache -f -v
```

# Wipe file system from USB

- Formatting to `ext4` and eliminate all previous partitions (example the `sdd1`):

```bash
sudo mkfs -t ext4 /dev/sdd1
```

- The device can be for example

```bash
sudo wipefs --all <device>
```

# Create a partition in the USB

- From the command line creating a partition

```bash
sudo cfdisk <device>
```

Change to dos partition table, then New to create a new partition, select as primary and write changes

# Make the file system in the partition

```bash
sudo mkfs.ext4 <device>
```

# Transfer or copy files using the binary `rsync`

- `sudo rsync [OPTIONS or FLAGS] /source /destination`
  - Flags:
    - `-a`, `--archive` : archive mode, meaning will not modify time stamp neither permissions
    - `-A`, `--acls` : preserve `ACLS`, which implies permissions
    - `-X`, `--xattrs` : preserve extended attributes
    - `--dry-run` : simulate the backup
    - `v`, `--verbose` : increase verbosity
    - `--delete` : makes a diff between source and destination and delete files on the destination which were deleted on source
    - `--exclude=/path/to/dir` : excludes the given directory on the backup, wild-card may be used

- Example (The project parent directory of source is not copied, only its contents, parent directory on destination must exist!):

```bash
sudo rysnc -aAXv --delete /home/jordan/project/ /mnt/project
```

# Access your android device (mobile, gsm, phone) by installing in your Linux

```bash
sudo pacman -S android-file-transfer
```

# Check for the window property under the Xorg server

The action below is just clicking on any windows where the application is running.

```
xprop <action>
```

# Check the key property under the Xorg server

Just press a button after running

```bash
xev
```

# Mount/Umount file systems

First check the device name using `lsblk`.
Mount a new device with name `/dev/sdd1` to `/mnt`:

```bash
sudo mount /dev/sdd1 /mnt
```

To unmount a device mounted on `/mnt` (device name is an alternative)

```bash
umount /mnt
```

# Tree up to a number of layers

```bash
tree -L <max number of branches>
```

# Compress zip

```bash
zip -r file.zip dir
```

# Extract zip to a directory

```bash
unzip file.zip
unzip file.zip -d <dir-name>
```

# To Compress tar

```bash
tar -zcvf archive.tar.gz dir1 file1
tar -jcvf archive.tar.bz2 dir1 file1
```

# To Extract an archive

```bash
tar -xf archive.xz
tar -zxvf archive.tar.gz
tar -zxvf archive.tar.gz -C /path/to/dir/
tar -jxvf archive.tar.bz2
tar -jxvf archive.tar.bz2 -C /path/to/dir/
```

# To View/List an archive

```bash
tar -ztvf archive.tar.gz
tar -jtvf archive.tar.bz2
```

# To change permissions of files and directories

```bash
find /base/dir -type d -print0 | xargs -0 chmod 770
find /base/dir -type f -print0 | xargs -0 chmod 660
```

# To install Nerd Fonts

Go to the [Hacker Nerd Font](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/Hack)

# To install jetBrains Mono

Go to [jetBrains Mono](https://www.jetbrains.com/lp/mono/)

Place the 'ttf' or 'otf' files on `~./local/share/fonts`

# To check size of a directory

```bash
du -sh dir
```

# To check your GPU usage

```bash
watch -n -1 nvidia-smi
```

# Synchronization of dot files steps

  1. Create a bare repository

```bash
git init --bare
```

  2. Create alias to sync your repo

```bash
alias syncdf='/usr/bin/git --git-dir=/home/alfredo/projects/my_dotfiles \
--work-tree=/home/alfredo'
```

  3. Do not show untracked files by default:

```bash
config config --local status.showUntrackedFiles no
```

# Grep using process (ps) with header

```bash
ps -ef | egrep "process|PID"   
```

# Arch Package Manager `pacman`

## After first install of arch-based distro

Update the mirrors and keyring respectively by

```bash
sudo pacman -Syy
sudo pacman -S archlinux-keyring
```

## Update and Sync pacman on Arch Linux

```bash
sudo pacman -Syu
```

## Remove unused repositories and not longer needed dependencies

```bash
sudo pacman -Sc
```

To remove a package

```bash
sudo pacman -R <package>
sudo pacman -Rcns <package>
```

# Change keyboard layout using Xorg

```bash
setxkbmap br
```

# Markdown conversion using pandoc

```
pandoc -s README.md -o output.pdf
```

# Checking and clearing log files by up to time given or size

```bash
journalctl --disk-usage
sudo journalctl --vacuum-time=2d
sudo journalctl --vacuum-size=500M
```

# Merge video files using ffmpeg

```bash
ffmpeg -f concat -safe 0 -i video_sequence.txt -c copy output.mp4
```

Inside the `video_sequence.txt` one will have an structure like:

```
file 'first.mp4'
file 'second.mp4'
file 'third.mp4'
```

# stow

To synch files and to remove symbolic links:

```bash
stow .
stow -D .
```

# sed

This command stands for **stream editor** and can perform functions like:
Searching, find and replace, insertion or deletion. Use the -i option to write the changes
Examples:

## To substitute every single X by Y in a file and write to the original file

```bash
sed -i "s/X/Y/g" <file>
```

## To remove a comment and whatever comes after in the comment

```bash
sed "s/#.*//g" <file>
```

## To remove spaces and other pattern use concatenation of substitutions with

```bash
sed "s/\s*#.*//g;s/X/Y/g" <file>
```

## Deletes all lines that are empty

```bash
sed "/^$/ d" <file>
```

# Alternative to traceroute

```bash
tracepath google.com
```

# Xandr

To list displays change the scale and/or resolution

```bash
xrandr
xandr --output DP-4 --scale 0.8x0.8
export GDK_SCALE=2
```

To see your dpi:

```bash
xrandr | grep -B 2 resolution
```

To calculate the right dpi value

```bash
xrandr | grep -w connected
```

Then divide your screen resolution by the dpi in mm x 10 / inches (2.54)
E.g 1920 / (600 x 10 / 2.54) ~ 81  (new dpi value)

```bash
xrandr --dpi 81
```

To enable and disable a monitor:

```bash
xrandr --output <DEVICE-ID> --auto
xrandr --output <DEVICE-ID> --off
```

To connect a second monitor, 3 steps:

```bash
xrandr --output <MAIN-monitor>  --primary
xrandr --output <SECOND-monitor> --set audio force-dvi --mode 1920x1080
xrandr --output <SECOND-monitor> --left-of <MAIN-monitor>
xrandr --output <SECOND-monitor> --right-of <MAIN-monitor>
```

To place your second monitor virtually to the right:

```bash
xrandr --output <LEFT-monitor> --auto --output <RIGHTmonitor> --right-of <LEFTmonitor>
```

To create modes using `xrandr`

```bash
xrandr --newmode <SETTINGS>
xrandr --addmode <DISPLAY-name>
```

# Change `sysrq` privileges

```bash
echo "1" | sudo tee /proc/sys/kernel/sysrq
```

Please note that the following will NOT work:

```
bash
echo "1" | sudo tee /proc/sys/kernel/sysrq
```

# List your services by state

```bash
systemctl list-units --state=<state>
```

# Check the battery of your laptop

Using the binary `upower` you have two options:

```bash
upower -i $(upower -e | grep BAT) | grep --color=never -E "state|to\ full|to\ empty|percentage"
upower -i /org/freedesktop/UPower/devices/battery_BAT1
```

# Connect to `wifi` using the terminal and `nmcli` (Network Manager CLI)

First check if the `wifi` is enabled:

```bash
nmcli radio wifi
```

Check the `wifi` list:

```bash
nmcli dev wifi list
```

Connect to the device:

```bash
sudo nmcli dev wifi connect <device> -a
```

the flag is to prompt for any missing arguments (password for example)

# Laptop screen brightness

First check which type of backlight do you have:

```bash
ls /sys/class/backlight/
cat /sys/class/backlight/<intel_backlight>/max_brightness
echo <new-value> > /sys/class/backlight/intel_backlight/brightness
```

Then just change it using `sudo` privileges

# Kitty Terminal Emulator themes

```bash
kitty +kitten themes
```
