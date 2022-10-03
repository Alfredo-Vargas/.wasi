### Makes vi possible in your terminal where you see one line at the time
set -o vi

###  EXPORT DEFAULTS  ###
export EDITOR='vim'
export IDE='nvim'
export VISUAL='vim'
# export HISTCONTROL=ignoreboth:erasedups
export HISTCONTROL=ignoreboth
export PAGER='less'  # used for man pages!

# Make less output colorfull (usefull for man pages)
LESS_TERMCAP_mb=$(tput bold; tput setaf 2)  # green
export LESS_TERMCAP_mb
# Start bold
LESS_TERMCAP_md=$(tput bold; tput setaf 2) # green
export LESS_TERMCAP_md
# Start stand out
LESS_TERMCAP_so=$(tput bold; tput setaf 3) # yellow
export LESS_TERMCAP_so
# End standout
LESS_TERMCAP_se=$(tput rmso; tput sgr0)
export LESS_TERMCAP_se
# Start underline
LESS_TERMCAP_us=$(tput smul; tput bold; tput setaf 1) # red
export LESS_TERMCAP_us
# End Underline
LESS_TERMCAP_ue=$(tput sgr0)
export LESS_TERMCAP_ue
# End bold, blinking, standout, underline
LESS_TERMCAP_me=$(tput sgr0)
export LESS_TERMCAP_me

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Adding to env variable $PATH

if [ -d "$HOME/.bin" ] ;
  then PATH="$HOME/.bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ] ;
  then PATH="$HOME/.local/bin:$PATH"
fi

if [ -d "$HOME/projects/scripts" ] ;
  then PATH="$HOME/projects/scripts:$PATH"
fi

if [ -d "$HOME/dataspell-2022.2.2/bin/" ] ;
  then PATH="$HOME/dataspell-2022.2.2/bin:$PATH"
fi


[ -z "$OS" ] && export OS=`uname`
case "$OS" in
  Linux)  export PLATFORM=linux ;;
  *indows*)  export PLATFORM=windows ;;
  FreeBSD|Darwin)  export PLATFORM=mac ;;
  *)  export PLATFORM=unknown ;;
esac


### Exports for Programs
export PATH="$PATH:$HOME/.cargo/bin"
export GOPATH=$HOME/go
export PATH="$PATH:$HOME/go/bin"
# export PATH="$PATH:$HOME/.local/share/gem/ruby/3.0.0/bin"
# Cross-shell propmt starship detection and configuration
if starship -V starship &> /dev/null
then
  eval "$(starship init bash)"  # runs starship which uses bash
else
  PS1="[\u@\h \W]\$ "
  export PS1;
fi

# ignore upper and lowercase when TAB completion
bind "set completion-ignore-case on"


### ALIASES ###
alias py='python'
alias ping='ping -c4'
alias kdek='nvim $HOME/projects/kde_shortcuts.md'
alias vimk='nvim $HOME/projects/vim_shortcuts.md'
alias cvim='cd ~/.config/slinks/nvim_config/'
alias scripts='cd $HOME/.wasi/projects/scripts/'
alias tm='cd ~/.config/slinks/thomas_more_dir/'
alias sm='cd ~/.config/slinks/summer_slink'
alias alf='cd ~/.config/slinks/mega_alfredo/'
alias tab='cd ~/.config/slinks/mega_tabitha/'
alias fd='fd -H'
alias wiki='nvim $HOME/projects/wiki'
alias basics='nvim $HOME/projects/basicsOf/'
alias byebye='sudo shutdown -h now'
alias rere='sudo reboot -h now'
alias rju='jupyter lab --no-browser --port'
# alias htb='$HOME/.wasi/projects/scripts/hextobin.sh'
# alias btd='\$HOME/.wasi/projects/scripts/bintodec.sh'

htb() {

  htb_script="$HOME/.wasi/projects/scripts/hextobin.sh"
  $htb_script "$1"

} && export -f htb

btd() {

  btd_script="$HOME/.wasi/projects/scripts/bintodec.sh"
  $btd_script "$1"

} && export -f btd

# export _lynx=$(which lynx)
# lynx() {
# 	if [[ -z "$_lynx" ]]; then
# 		telln "Doesn't look like $(lynx) is installed."
# 		return 1
# 	fi
# 	[[ -r ~/.config/lynx/lynx.cfg ]] && lynxcfg="-cfg=$HOME/.config/lynx/lynx.cfg"
# 	[[ -r ~/.config/lynx/lynx.lss ]] && lynxlss="-lss=$HOME/.config/lynx/lynx.cfg"
# 	$_lynx $lynxcfg $lynxlss "$*"
# } && export -f lynx

# urlencode () {
#   declare str-"$*"
#   declare encoded=""
#   declare i c x
#   for (( i=0; i<${#str}; i++ )); do
#     c=${str:$i:1}
#     case "$c" in
#       [-_.~a-zA-Z0-9] ) x="$c" ;;
#       * ) printf -v x '%%%02x' "'$c" ;;
#     esac
#     encoded+="$x"
#   done
#   echo "$encoded"
# }

# duck () {
#   declare url=$(urlencode "$*")
#   lynx "https://duckduckgo.com/lite?q=$url"
# }
# alias "?"=duck

# google () {
#   declare url=$(urlencode "$*")
#   lynx "https://google.com/search?q=$url"
# }
# alias "??"=google

# alias rm='rm -i'
# alias cp='cp -i'
# alias mv='mv -i'
# alias s="systemctl"
# alias j='journalctl -xe'

# list
if exa -v exa &> /dev/null
then
  alias ls="exa -l"
  alias la='exa -la'
  alias ll='exa -alFh'
  alias l='exa'
else
  alias ls='ls --color=auto'
  alias la='ls -a --color=auto'
  alias ll='ls -alFh --color=auto'
  alias l='ls --color=auto'
fi
# ip
alias ip='ip --color=auto'

# fix some naive typo's
alias cd..='cd ..'

## Colorize the grep command output for ease of use (good for log files)##
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

## Colorize the output of tree command
alias tree='tree -C'

# readable output
alias df='df -h'

# keyboard (can be handy specially in Belgium)
alias give-me-azerty-be="sudo localectl set-x11-keymap be"
alias give-me-qwerty-us="sudo localectl set-x11-keymap us"

# free
alias free="free -mt"

# continue download
alias wget="wget -c"

# userlist
alias userlist="cut -d: -f1 /etc/passwd"
# grouplist
alias grouplist="cut -d: -f1 /etc/group"


# Aliases for software managment
alias pacman='sudo pacman --color auto'
alias update='sudo pacman -Syyu'

# paru as aur helper - updates everything
alias pksyua="paru -Syu --noconfirm"
alias upall="paru -Syu --noconfirm"

# ps
alias psa="ps auxf"
alias psgrep="ps aux | grep -v grep | grep -i -e VSZ -e"

# add new fonts
alias update-fc='sudo fc-cache -fv'

#switch between bash and zsh
alias tobash="sudo chsh $USER -s /bin/bash && echo 'Now log out.'"
alias tozsh="sudo chsh $USER -s /bin/zsh && echo 'Now log out.'"

#switch between lightdm and sddm
alias tolightdm="sudo pacman -S lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings --noconfirm --needed ; sudo systemctl enable lightdm.service -f ; echo 'Lightm is active - reboot now'"
alias tosddm="sudo pacman -S sddm --noconfirm --needed ; sudo systemctl enable sddm.service -f ; echo 'Sddm is active - reboot now'"

#hardware info --short
alias hw="hwinfo --short"

#skip integrity check
alias paruskip='paru -S --mflags --skipinteg'

#check vulnerabilities microcode
alias microcode='grep . /sys/devices/system/cpu/vulnerabilities/*'

#get fastest mirrors in your neighborhood
alias mirror="sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist"
alias mirrord="sudo reflector --latest 30 --number 10 --sort delay --save /etc/pacman.d/mirrorlist"
alias mirrors="sudo reflector --latest 30 --number 10 --sort score --save /etc/pacman.d/mirrorlist"
alias mirrora="sudo reflector --latest 30 --number 10 --sort age --save /etc/pacman.d/mirrorlist"

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
alias vlightdm="sudo $EDITOR /etc/lightdm/lightdm.conf"
alias vpacman="sudo $EDITOR /etc/pacman.conf"
alias vmkinitcpio="sudo $EDITOR /etc/mkinitcpio.conf"
alias vmirrorlist="sudo $EDITOR /etc/pacman.d/mirrorlist"
alias varcomirrorlist='sudo nano /etc/pacman.d/arcolinux-mirrorlist'
alias vsddm="sudo $EDITOR /etc/sddm.conf"
alias vsddmk="sudo $EDITOR /etc/sddm.conf.d/kde_settings.conf"
alias vfstab="sudo $EDITOR /etc/fstab"
alias vnsswitch="sudo $EDITOR /etc/nsswitch.conf"
alias vsamba="sudo $EDITOR /etc/samba/smb.conf"
alias vgnupgconf="sudo $EDITOR /etc/pacman.d/gnupg/gpg.conf"
alias vhosts="sudo $EDITOR /etc/hosts"
alias vb="$IDE ~/.bashrc"

#gpg
#verify signature for isos
alias gpg-check="gpg2 --keyserver-options auto-key-retrieve --verify"
alias fix-gpg-check="gpg2 --keyserver-options auto-key-retrieve --verify"
#receive the key of a developer
alias gpg-retrieve="gpg2 --keyserver-options auto-key-retrieve --receive-keys"
alias fix-gpg-retrieve="gpg2 --keyserver-options auto-key-retrieve --receive-keys"
alias fix-keyserver="[ -d ~/.gnupg ] || mkdir ~/.gnupg ; cp /etc/pacman.d/gnupg/gpg.conf ~/.gnupg/ ; echo 'done'"

#maintenance
alias big="expac -H M '%m\t%n' | sort -h | nl"
alias downgrada="sudo downgrade --ala-url https://ant.seedhost.eu/arcolinux/"

#hblock (stop tracking with hblock)
#use unhblock to stop using hblock
alias unhblock="hblock -S none -D none"

#systeminfo
alias probe="sudo -E hw-probe -all -upload"
alias sysfailed="systemctl list-units --failed"

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

#remove
alias rmgitcache="rm -r ~/.cache/git"

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
