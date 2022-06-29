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
The device can be for example 
```bash
sudo wipefs --all <device>
```

# Create a partition in the USB
```bash
sudo cfdisk <device>
```
Change to dos partition table, then New to create a new partition, select as primary and write changes

# Make the file system in the partition
```bash
sudo mkfs.ext4 <device>
```

# Transfer or copy files using the binary `rsync`
To copy files (place/omit the verbose option when needed `-av`):
```bash
rsync -a --progress <source> <destination>
```


# Access your android device (mobile, gsm, phone) by installing in your Linux:
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

# To change mod of many objects
```bash
chmod 755 $(find /path/to/base/dir -type d)
chmod 644 $(find /path/to/base/dir -type f)
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

# Synchronization of dot files steps:
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
To list a package
```bash
sudo pacman -Ss <package>
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
To force an update to substitute all previous dependencies
```bash
sudo pacman -S npm --overwrite='*'
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
This command stands for *_stream editor_* and can perform functions like:
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

## To remove spaces and other pattern use concatenation of substitutions with ;
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

# Kitty Terminal Emulator themes:
```bash
kitty +kitten themes
```
