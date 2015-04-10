# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
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

# Color Code me Bro
RED='\[\033[31m\]'

# Get Virtual Env
if [[ $CONDA_DEFAULT_ENV != "" ]]
    then
      # Strip out the path and just leave the env name
      venv=" ${RED}(${CONDA_DEFAULT_ENV##*/})"
else
      # In case you don't have one activated
      venv=''
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
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
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

if command -v tmux>/dev/null; then
  [[ ! $TERM =~ screen ]] && [ -z $TMUX ] && exec tmux -u -2
fi

# path for maven
export PATH=$HOME/SOFTWARES/apache-maven-3.2.2/bin:$PATH

export JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64/

alias format_file="astyle \
	--style=allman --lineend=linux --indent=tab=8 \
	--break-blocks --unpad-paren --pad-header --pad-oper \
    --close-templates --add-brackets \
    --align-pointer=middle --align-reference=name"

alias ipython3_qt="ipython3 qtconsole --ConsoleWidget.font_size=10 --colors=linux"
alias ipython_qt="ipython qtconsole --ConsoleWidget.font_size=10 --colors=linux"

export PATH=$HOME/SOFTWARES/pypy-2.3.1-linux64/bin/:$PATH

alias cls="clear;ls"

export HADOOP_PREFIX=$HOME/SOFTWARES/hadoop-1.2.1/
alias ccp="tmux show-buffer | xclip -i -selection clipboard"

# path for HADOOP
export PATH=$HOME/SOFTWARES/hadoop-1.2.1/bin/:$PATH

# path for HIVE
export PATH=$HOME/SOFTWARES/apache-hive-0.13.1-bin/bin:$PATH

# path for EMR
export PATH=$HOME/SOFTWARES/elastic-mapreduce-cli:$PATH

# path for PIG
export PATH=$HOME/SOFTWARES/pig-0.12.0/bin:$PATH

# path for PyCharm
export PATH=$HOME/SOFTWARES/pycharm-community-4.0.3/bin:$PATH

# path for Conda
export PATH=$HOME/anaconda3/bin:$PATH

# path for PyCharm JDK
export PYCHARM_JDK=$HOME/SOFTWARES/jre1.7.0/

# path for hugin
export HUGINHOME=$HOME/Downloads/HUGIN_LITE_64.linux/

# alias for old MATLAB (R2014a)
alias matlab-old='exec $HOME/MATLAB/R2014a/bin/matlab'

# added by Anaconda3 2.1.0 installer
export PATH=$HOME/anaconda3/bin:$PATH

. ~/.bash_prompt.sh

# alias for pgmpy server
alias pgmpy-connect='ssh pgmpy@54.148.119.229'

# include path for tunnel start and stop scripts
export PATH=$HOME/PROJECTS/bidgely/:$PATH

# Setting up and down arrow to search in command history for previous commands
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

