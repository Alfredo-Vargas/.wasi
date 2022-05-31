# Wipe file system from USB
The device can be for example 
```console
sudo wipefs --all <device>
```

# Create a partition in the USB
```console
sudo cfdisk <device>
```
Change to dos partition table, then New to create a new partition, select as primary and write changes

# Make the file system in the partition
```console
sudo mkfs.ext4 <device>
```

# Transfer or copy files using the binary `rsync`
To copy files (place/omit the verbose option when needed `-av`):
```console
rsync -a --progress <source> <destination>
```


# Access your android device (mobile, gsm, phone) by installing in your Linux:
```console
sudo pacman -S android-file-transfer
```

# Check for the window property under the Xorg server
The action below is just clicking on any windows where the application is running.
```
xprop <action>
```

# Check the key property under the Xorg server 
Just press a button after running
```console
xev
```
# Mount/Umount file systems
First check the device name using `lsblk`.
Mount a new device with name `/dev/sdd1` to `/mnt`:
```console
sudo mount /dev/sdd1 /mnt
```
To unmount a device mounted on `/mnt` (device name is an alternative)
```console
umount /mnt
```

# Tree up to a number of layers
```console
tree -L <max number of branches>
```

# Compress zip
```console
zip -r file.zip dir
```
# Extract zip to a directory
```console
unzip file.zip
unzip file.zip -d <dir-name>
```

# To Compress tar
```console
tar -zcvf archive.tar.gz dir1 file1
tar -jcvf archive.tar.bz2 dir1 file1
```

# To Extract an archive
```console
tar -xf archive.xz
tar -zxvf archive.tar.gz
tar -zxvf archive.tar.gz -C /path/to/dir/
tar -jxvf archive.tar.bz2
tar -jxvf archive.tar.bz2 -C /path/to/dir/
```

# To View/List an archive
```console
tar -ztvf archive.tar.gz
tar -jtvf archive.tar.bz2
```

# To change mod of many objects
```console
chmod 755 $(find /path/to/base/dir -type d)
chmod 644 $(find /path/to/base/dir -type f)
```

# To install Nerd Fonts
Go to the [Hacker Nerd Font](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/Hack)

# To install jetBrains Mono
Go to [jetBrains Mono](https://www.jetbrains.com/lp/mono/)

Place the 'ttf' or 'otf' files on `~./local/share/fonts`

# To check size of a directory
```console
du -sh dir
```
# To check your GPU usage
```console
watch -n -1 nvidia-smi
```

# Synchronization of dot files steps:
  1. Create a bare repository
```console
git init --bare
```
  2. Create alias to sync your repo 
```console
alias syncdf='/usr/bin/git --git-dir=/home/alfredo/projects/my_dotfiles \
--work-tree=/home/alfredo'
```
  3. Do not show untracked files by default:
```console
config config --local status.showUntrackedFiles no
```

# Grep using process (ps) with header
```console
ps -ef | egrep "process|PID"   
```

# Arch Package Manager `pacman`

## After first install of arch-based distro
Update the mirrors and keyring respectively by
```console
sudo pacman -Syy
sudo pacman -S archlinux-keyring
```

## Update and Sync pacman on Arch Linux
```console
sudo pacman -Syu
```

## Remove unused repositories and not longer needed dependencies
```console
sudo pacman -Sc
```
To remove a package
```console
sudo pacman -R <package>
sudo pacman -Rcns <package>
```



# Change keyboard layout using Xorg
```console
setxkbmap br
```
# Markdown conversion using pandoc
```
pandoc -s README.md -o output.pdf
```

# Checking and clearing log files by up to time given or size
```console
journalctl --disk-usage
sudo journalctl --vacuum-time=2d
sudo journalctl --vacuum-size=500M
```

# Merge video files using ffmpeg
```console
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
```console
stow .
stow -D .
```

# sed
This command stands for *_stream editor_* and can perform functions like:
Searching, find and replace, insertion or deletion. Use the -i option to write the changes
Examples:

## To substitute every single X by Y in a file and write to the original file
```console
sed -i "s/X/Y/g" <file>
```

## To remove a comment and whatever comes after in the comment
```console
sed "s/#.*//g" <file>
```

## To remove spaces and other pattern use concatenation of substitutions with ;
```console
sed "s/\s*#.*//g;s/X/Y/g" <file>
```

## Deletes all lines that are empty
```console
sed "/^$/ d" <file>
```

# Alternative to traceroute
```console
tracepath google.com
```

# Xandr
To list displays change the scale and/or resolution
```console
xrandr
xandr --output DP-4 --scale 0.8x0.8
export GDK_SCALE=2
```
To see your dpi:
```console
xrandr | grep -B 2 resolution
```
To calculate the right dpi value
```console
xrandr | grep -w connected
```

Then divide your screen resolution by the dpi in mm x 10 / inches (2.54)
E.g 1920 / (600 x 10 / 2.54) ~ 81  (new dpi value)
```console
xrandr --dpi 81
```

To enable and disable a monitor:
```console
xrandr --output <DEVICE-ID> --auto
xrandr --output <DEVICE-ID> --off
```

To connect a second monitor, 3 steps:
```console
xrandr --output <MAIN-monitor>  --primary
xrandr --output <SECOND-monitor> --set audio force-dvi --mode 1920x1080
xrandr --output <SECOND-monitor> --left-of <MAIN-monitor>
xrandr --output <SECOND-monitor> --right-of <MAIN-monitor>
```

To place your second monitor virtually to the right:
```console
xrandr --output <LEFT-monitor> --auto --output <RIGHTmonitor> --right-of <LEFTmonitor>
```

To create modes using `xrandr`
```console
xrandr --newmode <SETTINGS>
xrandr --addmode <DISPLAY-name>
```

# Change `sysrq` privileges
```console
echo "1" | sudo tee /proc/sys/kernel/sysrq
```
Please note that the following will NOT work:
```
console
echo "1" | sudo tee /proc/sys/kernel/sysrq
```

# List your services by state
```console
systemctl list-units --state=<state>
```

# Check the battery of your laptop
Using the binary `upower` you have two options:
```console
upower -i $(upower -e | grep BAT) | grep --color=never -E "state|to\ full|to\ empty|percentage"
upower -i /org/freedesktop/UPower/devices/battery_BAT1
```

# Connect to `wifi` using the terminal and `nmcli` (Network Manager CLI)
First check if the `wifi` is enabled:
```console
nmcli radio wifi
```
Check the `wifi` list:
```console
nmcli dev wifi list
```
Connect to the device:
```console
sudo nmcli dev wifi connect <device> -a
```
the flag is to prompt for any missing arguments (password for example)

# Laptop screen brightness
First check which type of backlight do you have:
```console
ls /sys/class/backlight/
cat /sys/class/backlight/<intel_backlight>/max_brightness
echo <new-value> > /sys/class/backlight/intel_backlight/brightness
```
Then just change it using `sudo` privileges

# Kitty Terminal Emulator themes:
```console
kitty +kitten themes
```
