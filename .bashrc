# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return


#history options

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth


# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
#HISTSIZE=1000
#HISTFILESIZE=2000

# 忽略重复的命令
#HISTCONTROL=ignoredups
export HISTCONTROL
# 忽略由冒号分割的这些命令
HISTIGNORE="[   ]*:&:bg:fg:exit"
# 设置保存历史命令的文件大小
HISTFILESIZE=1000000
# 保存历史命令条数
HISTSIZE=1000000
# append to the history file, don't overwrite it
shopt -s histappend

export PROMPT_COMMAND="history -a; $PROMPT_COMMAND"




# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\W\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi


#####################################################################################
#blow are edited by lzh

#set ifortran env vars
source /opt/intel/bin/ifortvars.sh intel64
#set env vars for mkl lib
#if [ -f /opt/intel/composer_xe_2013.1.117/mkl/bin/intel64/mklvars_intel64.sh ]; then
#        source /opt/intel/composer_xe_2013.1.117/mkl/bin/intel64/mklvars_intel64.sh
#fi
source /opt/intel/composer_xe_2013.1.117/mkl/bin/intel64/mklvars_intel64.sh
OMP_NUM_THREADS=6
export OMP_NUM_THREADS




PYTHONPATH=/home/chiwhalee/dropbox/My-documents/My-code/quantum-many-body/mera-algorithms/python
export PYTHONPATH
#PYTHONPATH=/home/chiwhalee/sharefolder  #:/home/chiwhalee/dropbox-share/quantum-many-body/mera/Ternary/new


#PYTHONPATH=/home/chiwhalee/sharefolder:/home/chiwhalee/download/sage/local/lib/python2.6/site-packages:/home/chiwhalee/download/sage/devel/sagenb-main
#export PYTHONPATH
#SAGE_DOC=/home/chiwhalee/download/sage/devel/sage-main/doc
#export SAGE_DOC
#SAGE_ROOT=/home/chiwhalee/download/sage
#export  SAGE_ROOT
#export LD_LIBRARY_PATH=$SAGE_ROOT/local/lib:$LD_LIBRARY_PATH
#I'm sure sage lib locates here as e.g. libpari.a only exists here








#alias cdmera="cd ~/mera/Ternary/new"

#alias cdmera="cd ~/dropbox/quantum-many-body/mera/Ternary/new"
alias cdmera="cd /home/chiwhalee/dropbox/My-documents/My-code/quantum-many-body/mera-algorithms/python/current"
alias mtmera="sudo mount -t vboxsf mera-shared ~/mera"
alias mtsage="sudo mount -t vboxsf my-sage ~/share-sage"
alias sage="/home/chiwhalee/download/sage-5.2-linux-64bit-ubuntu_12.04_lts-x86_64-Linux/sage"


alias zhli="ssh -X zhli@210.45.113.69"
alias zhliip="zhli@210.45.113.69"
alias scpmera="scp /home/chiwhalee/mera/Ternary/new/*.* zhli@210.45.113.69:Ternary/new/"


