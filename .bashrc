### EXPORT TEST ###
export EDITOR='vim'
export VISUAL='vim'
export HISTCONTROL=ignoreboth:erasedups
export PAGER='less'  # used for man pages!
# To open Android studio in DWM
export _JAVA_AWT_WM_NONREPARENTING=1

# Make less output colorfull (usefull for man pages)
export LESS_TERMCAP_mb=$(tput bold; tput setaf 2) # green
# Start bold
export LESS_TERMCAP_md=$(tput bold; tput setaf 2) # green
# Start stand out
export LESS_TERMCAP_so=$(tput bold; tput setaf 3) # yellow
# End standout
export LESS_TERMCAP_se=$(tput rmso; tput sgr0)
# Start underline
export LESS_TERMCAP_us=$(tput smul; tput bold; tput setaf 1) # red
# End Underline
export LESS_TERMCAP_ue=$(tput sgr0)
# End bold, blinking, standout, underline
export LESS_TERMCAP_me=$(tput sgr0)


#Ibus settings if you need them
#type ibus-setup in terminal to change settings and start the daemon
#delete the hashtags of the next lines and restart
#export GTK_IM_MODULE=ibus
#export XMODIFIERS=@im=dbus
#export QT_IM_MODULE=ibus

# PS1='[\u@\h \W]\$ '
PS1="\W\$ " # so your username does not appear
# PS2 is the secondary prompt
export PS1;

# If not running interactively, don't do anything
[[ $- != *i* ]] && return


if [ -d "$HOME/.bin" ] ;
  then PATH="$HOME/.bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ] ;
  then PATH="$HOME/.local/bin:$PATH"
fi

export PATH="$PATH:/home/alfredo/.cargo/bin"

#ignore upper and lowercase when TAB completion
bind "set completion-ignore-case on"


# export PATH="$PATH:~/.config/Qt/Tools/QtCreator/bin"
# export PATH="$PATH:/home/alfredo/.local/share/gem/ruby/3.0.0/bin"

### ALIASES ###

alias cvim='cd ~/.config/slinks/nvim_config/'
alias tm='cd ~/.config/slinks/thomas_more_dir/'
alias sm='cd ~/.config/slinks/summer_slink'
alias alf='cd ~/.config/slinks/mega_alfredo/'
alias tab='cd ~/.config/slinks/mega_tabitha/'
alias fd='fd -H'
alias t6='/home/alfredo/projects/scripts/t2x3'
alias t4='/home/alfredo/projects/scripts/t2x2'
alias t2='/home/alfredo/projects/scripts/t1x2'
alias t32='/home/alfredo/projects/scripts/t3x2'
alias myide='/home/alfredo/projects/scripts/ide'
alias wiki='nvim /home/alfredo/projects/wiki'
alias expresspush='sh /home/alfredo/projects/scripts/git_update.sh'
alias byebye='sudo shutdown -h now'
alias rere='sudo reboot -h now'

# set -o vi

# . "$HOME/.cargo/env"

eval "$(starship init bash)"
#list
alias ls='ls --color=auto'
alias la='ls -a'
alias ll='ls -alFh'
alias l='ls'
alias l.="ls -A | egrep '^\.'"
#ip
alias ip='ip --color=auto'

#fix obvious typo's
alias cd..='cd ..'
alias pdw='pwd'
alias udpate='sudo pacman -Syyu'
alias upate='sudo pacman -Syyu'
alias updte='sudo pacman -Syyu'
alias updqte='sudo pacman -Syyu'
alias upqll='paru -Syu --noconfirm'
alias upal='paru -Syu --noconfirm'

## Colorize the grep command output for ease of use (good for log files)##
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

#readable output
alias df='df -h'

#keyboard
alias give-me-azerty-be="sudo localectl set-x11-keymap be"
alias give-me-qwerty-us="sudo localectl set-x11-keymap us"
alias give-me-qwerty-br="sudo localectl set-x11-keymap br-abnt2"

#pacman unlock
alias unlock="sudo rm /var/lib/pacman/db.lck"
alias rmpacmanlock="sudo rm /var/lib/pacman/db.lck"

#arcolinux logout unlock
alias rmlogoutlock="sudo rm /tmp/arcologout.lock"

#which graphical card is working
alias whichvga="/usr/local/bin/arcolinux-which-vga"

#free
alias free="free -mt"

#continue download
alias wget="wget -c"

#userlist
alias userlist="cut -d: -f1 /etc/passwd"

# Aliases for software managment
# pacman or pm
alias pacman='sudo pacman --color auto'
alias update='sudo pacman -Syyu'

# paru as aur helper - updates everything
alias pksyua="paru -Syu --noconfirm"
alias upall="paru -Syu --noconfirm"

#ps
alias psa="ps auxf"
alias psgrep="ps aux | grep -v grep | grep -i -e VSZ -e"

#grub update
alias update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"

#add new fonts
alias update-fc='sudo fc-cache -fv'

#copy/paste all content of /etc/skel over to home folder - backup of config created - beware
alias skel='[ -d ~/.config ] || mkdir ~/.config && cp -Rf ~/.config ~/.config-backup-$(date +%Y.%m.%d-%H.%M.%S) && cp -rf /etc/skel/* ~'
#backup contents of /etc/skel to hidden backup folder in home/user
alias bupskel='cp -Rf /etc/skel ~/.skel-backup-$(date +%Y.%m.%d-%H.%M.%S)'

#copy shell configs
alias cb='cp /etc/skel/.bashrc ~/.bashrc && exec bash'
alias cz='cp /etc/skel/.zshrc ~/.zshrc && echo "Copied."'
alias cf='cp /etc/skel/.config/fish/config.fish ~/.config/fish/config.fish && echo "Copied."'

#switch between bash and zsh
alias tobash="sudo chsh $USER -s /bin/bash && echo 'Now log out.'"
alias tozsh="sudo chsh $USER -s /bin/zsh && echo 'Now log out.'"
alias tofish="sudo chsh $USER -s /bin/fish && echo 'Now log out.'"

#switch between lightdm and sddm
alias tolightdm="sudo pacman -S lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings --noconfirm --needed ; sudo systemctl enable lightdm.service -f ; echo 'Lightm is active - reboot now'"
alias tosddm="sudo pacman -S sddm --noconfirm --needed ; sudo systemctl enable sddm.service -f ; echo 'Sddm is active - reboot now'"
alias toly="sudo pacman -S ly --noconfirm --needed ; sudo systemctl enable ly.service -f ; echo 'Ly is active - reboot now'"
alias togdm="sudo pacman -S gdm --noconfirm --needed ; sudo systemctl enable gdm.service -f ; echo 'Gdm is active - reboot now'"
alias tolxdm="sudo pacman -S lxdm --noconfirm --needed ; sudo systemctl enable lxdm.service -f ; echo 'Lxdm is active - reboot now'"

# kill commands
# quickly kill conkies
alias kc='killall conky'
# quickly kill polybar
alias kp='killall polybar'
# quickly kill picom
alias kpi='killall picom'

#hardware info --short
alias hw="hwinfo --short"

#skip integrity check
alias paruskip='paru -S --mflags --skipinteg'
alias yayskip='yay -S --mflags --skipinteg'
alias trizenskip='trizen -S --skipinteg'

#check vulnerabilities microcode
alias microcode='grep . /sys/devices/system/cpu/vulnerabilities/*'

#get fastest mirrors in your neighborhood
alias mirror="sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist"
alias mirrord="sudo reflector --latest 30 --number 10 --sort delay --save /etc/pacman.d/mirrorlist"
alias mirrors="sudo reflector --latest 30 --number 10 --sort score --save /etc/pacman.d/mirrorlist"
alias mirrora="sudo reflector --latest 30 --number 10 --sort age --save /etc/pacman.d/mirrorlist"
#our experimental - best option for the moment
#
alias mirrorx="sudo reflector --age 6 --latest 20  --fastest 20 --threads 5 --sort rate --protocol https --save /etc/pacman.d/mirrorlist"
alias mirrorxx="sudo reflector --age 6 --latest 20  --fastest 20 --threads 20 --sort rate --protocol https --save /etc/pacman.d/mirrorlist"
alias ram='rate-mirrors --allow-root arch | sudo tee /etc/pacman.d/mirrorlist'

#mounting the folder Public for exchange between host and guest on virtualbox
alias vbm="sudo /usr/local/bin/arcolinux-vbox-share"

#enabling vmware services
alias start-vmware="sudo systemctl enable --now vmtoolsd.service"
alias sv="sudo systemctl enable --now vmtoolsd.service"

#shopt
shopt -s autocd # change to named directory
shopt -s cdspell # autocorrects cd misspellings
shopt -s cmdhist # save multi-line commands in history as single line
shopt -s dotglob
shopt -s histappend # do not overwrite history
shopt -s expand_aliases # expand aliases

#youtube download
alias yta-aac="yt-dlp --extract-audio --audio-format aac "
alias yta-best="yt-dlp --extract-audio --audio-format best "
alias yta-flac="yt-dlp --extract-audio --audio-format flac "
alias yta-mp3="yt-dlp --extract-audio --audio-format mp3 "
alias ytv-best="yt-dlp -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/bestvideo+bestaudio' --merge-output-format mp4 "

#Recent Installed Packages
alias rip="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -200 | nl"
alias riplong="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -3000 | nl"

#iso and version used to install ArcoLinux
alias iso="cat /etc/dev-rel | awk -F '=' '/ISO/ {print $2}'"

#Cleanup orphaned packages
alias cleanup='sudo pacman -Rns $(pacman -Qtdq)'

#clear
alias clean="clear; seq 1 $(tput cols) | sort -R | sparklines | lolcat"

#search content with ripgrep
alias rg="rg --sort path"

#get the error messages from journalctl
alias jctl="journalctl -p 3 -xb"

#nano for important configuration files
#know what you do in these files
alias nlxdm="sudo $EDITOR /etc/lxdm/lxdm.conf"
alias nlightdm="sudo $EDITOR /etc/lightdm/lightdm.conf"
alias npacman="sudo $EDITOR /etc/pacman.conf"
alias ngrub="sudo $EDITOR /etc/default/grub"
alias nconfgrub="sudo $EDITOR /boot/grub/grub.cfg"
alias nmkinitcpio="sudo $EDITOR /etc/mkinitcpio.conf"
alias nmirrorlist="sudo $EDITOR /etc/pacman.d/mirrorlist"
alias narcomirrorlist='sudo nano /etc/pacman.d/arcolinux-mirrorlist'
alias nsddm="sudo $EDITOR /etc/sddm.conf"
alias nsddmk="sudo $EDITOR /etc/sddm.conf.d/kde_settings.conf"
alias nfstab="sudo $EDITOR /etc/fstab"
alias nnsswitch="sudo $EDITOR /etc/nsswitch.conf"
alias nsamba="sudo $EDITOR /etc/samba/smb.conf"
alias ngnupgconf="sudo nano /etc/pacman.d/gnupg/gpg.conf"
alias nhosts="sudo $EDITOR /etc/hosts"
alias nb="$EDITOR ~/.bashrc"
alias nz="$EDITOR ~/.zshrc"
alias nf="EDITOR ~/.config/fish/config.fish"

#gpg
#verify signature for isos
alias gpg-check="gpg2 --keyserver-options auto-key-retrieve --verify"
alias fix-gpg-check="gpg2 --keyserver-options auto-key-retrieve --verify"
#receive the key of a developer
alias gpg-retrieve="gpg2 --keyserver-options auto-key-retrieve --receive-keys"
alias fix-gpg-retrieve="gpg2 --keyserver-options auto-key-retrieve --receive-keys"
alias fix-keyserver="[ -d ~/.gnupg ] || mkdir ~/.gnupg ; cp /etc/pacman.d/gnupg/gpg.conf ~/.gnupg/ ; echo 'done'"

#fixes
alias fix-permissions="sudo chown -R $USER:$USER ~/.config ~/.local"
alias keyfix="/usr/local/bin/arcolinux-fix-pacman-databases-and-keys"
alias key-fix="/usr/local/bin/arcolinux-fix-pacman-databases-and-keys"
alias keys-fix="/usr/local/bin/arcolinux-fix-pacman-databases-and-keys"
alias fixkey="/usr/local/bin/arcolinux-fix-pacman-databases-and-keys"
alias fixkeys="/usr/local/bin/arcolinux-fix-pacman-databases-and-keys"
alias fix-key="/usr/local/bin/arcolinux-fix-pacman-databases-and-keys"
alias fix-keys="/usr/local/bin/arcolinux-fix-pacman-databases-and-keys"
alias fix-sddm-config="/usr/local/bin/arcolinux-fix-sddm-config"
alias fix-pacman-conf="/usr/local/bin/arcolinux-fix-pacman-conf"
alias fix-pacman-keyserver="/usr/local/bin/arcolinux-fix-pacman-gpg-conf"

#maintenance
alias big="expac -H M '%m\t%n' | sort -h | nl"
alias downgrada="sudo downgrade --ala-url https://ant.seedhost.eu/arcolinux/"

#hblock (stop tracking with hblock)
#use unhblock to stop using hblock
alias unhblock="hblock -S none -D none"

#systeminfo
alias probe="sudo -E hw-probe -all -upload"
alias sysfailed="systemctl list-units --failed"

#shutdown or reboot
#alias ssn="sudo shutdown now"
#alias sr="sudo reboot"

#update betterlockscreen images
alias bls="betterlockscreen -u /usr/share/backgrounds/arcolinux/"

#give the list of all installed desktops - xsessions desktops
alias xd="ls /usr/share/xsessions"

# # ex = EXtractor for all kinds of archives
# # usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.deb)       ar x $1      ;;
      *.tar.xz)    tar xf $1    ;;
      *.tar.zst)   tar xf $1    ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

#btrfs aliases
alias btrfsfs="sudo btrfs filesystem df /"
alias btrfsli="sudo btrfs su li / -t"

#snapper aliases
alias snapcroot="sudo snapper -c root create-config /"
alias snapchome="sudo snapper -c home create-config /home"
alias snapli="sudo snapper list"
alias snapcr="sudo snapper -c root create"
alias snapch="sudo snapper -c home create"

#Leftwm aliases
alias lti="leftwm-theme install"
alias ltu="leftwm-theme uninstall"
alias lta="leftwm-theme apply"
alias ltupd="leftwm-theme update"
alias ltupg="leftwm-theme upgrade"

#arcolinux applications
alias att="arcolinux-tweak-tool"
alias adt="arcolinux-desktop-trasher"
alias abl="arcolinux-betterlockscreen"
alias agm="arcolinux-get-mirrors"
alias amr="arcolinux-mirrorlist-rank-info"
alias aom="arcolinux-osbeck-as-mirror"
alias ars="arcolinux-reflector-simple"
alias atm="arcolinux-tellme"
alias avs="arcolinux-vbox-share"
alias awa="arcolinux-welcome-app"

#remove
alias rmgitcache="rm -r ~/.cache/git"

#moving your personal files and folders from /personal to ~
alias personal='cp -Rf /personal/* ~'

#create a file called .bashrc-personal and put all your personal aliases
#in there. They will not be overwritten by skel.

# [[ -f ~/.bashrc-personal ]] && . ~/.bashrc-personal
# reporting tools - install when not installed
# neofetch
# screenfetch
# alsi
# paleofetch
# fetch
# hfetch
# sfetch
# ufetch
# ufetch-arco
# pfetch
# sysinfo
# sysinfo-retro
# cpufetch
# colorscript random

unset CONDA_SHLVL
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/alfredo/.config/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/alfredo/.config/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/alfredo/.config/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/alfredo/.config/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
