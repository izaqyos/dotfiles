echo "Loading yosi izaq BASHRC for SAP MAC environment"
# base-files version 3.9-3


# Environment Variables
# #####################

# TMP and TEMP are defined in the Windows environment.  Leaving
# them set to the default Windows temporary directory can have
# unexpected consequences.
unset TMP
unset TEMP

# Alternatively, set them to the Cygwin temporary directory
# or to any other tmp directory of your choice
# export TMP=/tmp
# export TEMP=/tmp

# Or use TMPDIR instead
# export TMPDIR=/tmp

# Shell Options
# #############

# See man bash for more options...

# Don't wait for job termination notification
 set -o notify

# Don't use ^D to exit
# set -o ignoreeof

# Use case-insensitive filename globbing
# shopt -s nocaseglob

# Make bash append rather than overwrite the history on disk
 shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=5000  

HISTFILESIZE=2000

# When changing directory small typos can be ignored by bash
# for example, cd /vr/lgo/apaache would find /var/log/apache
 shopt -s cdspell


# Completion options
# ##################

# These completion tuning parameters change the default behavior of bash_completion:

# Define to access remotely checked-out files over passwordless ssh for CVS
# COMP_CVS_REMOTE=1

# Define to avoid stripping description in --option=description of './configure --help'
# COMP_CONFIGURE_HINTS=1

# Define to avoid flattening internal contents of tar files
# COMP_TAR_INTERNAL_PATHS=1

# If this shell is interactive, turn on programmable completion enhancements.
# Any completions you add in ~/.bash_completion are sourced last.
# case $- in
#   *i*) [[ -f /etc/bash_completion ]] && . /etc/bash_completion ;;
# esac


# History Options
# ###############

# Don't put duplicate lines in the history.
 export HISTCONTROL="ignoredups"

# Ignore some controlling instructions
# HISTIGNORE is a colon-delimited list of patterns which should be excluded.
# The '&' is a special pattern which suppresses duplicate entries.
# export HISTIGNORE=$'[ \t]*:&:[fb]g:exit'
# export HISTIGNORE=$'[ \t]*:&:[fb]g:exit:ls' # Ignore the ls command as well

# Whenever displaying the prompt, write the previous line to disk
 export PROMPT_COMMAND="history -a"


# Aliases
# #######

# Some example alias instructions
# If these are enabled they will be used instead of any instructions
# they may mask.  For example, alias rm='rm -i' will mask the rm
# application.  To override the alias instruction use a \ before, ie
# \rm will call the real rm not the alias.

# Interactive operation...
# alias rm='rm -i'
# alias cp='cp -i'
# alias mv='mv -i'

# Default to human readable figures
 alias df='df -h'
 alias du='du -h'

# Misc :)
# alias less='less -r'                          # raw control characters
 alias whence='type -a'                        # where, of a sort
 alias grep='grep --color'                     # show differences in colour

# Some shortcuts for different directory listings
 alias ls='ls -hF '
 alias dir='ls '
 alias ll='ls -l'                              # long list
 alias la='ls -A'                              # all but . and ..
 alias l='ls -CF'                              #


# Functions
# #########

# Some example functions
# function settitle() { echo -ne "\e]2;$@\a\e]1;$@\a"; }

## editor for crontab, cvs
EDITOR=vi
export EDITOR

## pager for man
PAGER=less
export PAGER
#path variables
#clearcase
#PATH=${PATH}:$HOME:/Users/yizaq/Desktop/Work/scripts/util/:/Users/yizaq/Desktop/Work/scripts/perl/:/Users/yizaq/Desktop/Work/scripts/perl/util/:/Users/yizaq/Desktop/Work/scripts/python/util:/Users/yizaq/Desktop/Work/scripts/sh:
#PATH=${PATH}:/Users/yizaq/Desktop/Work/scripts/sed/:

#Python
#Python module path (like java classpath)
PYTHONPATH=/usr/bin/python
#Python interactinve shell startup file.
PYTHONSTARTUP=~/.pythonrc
export PYTHONSTARTUP

#Java
export JAVA_HOME=$(/usr/libexec/java_home -V 1.8.0_292 &> /dev/null)



#compatible to either intel or arm homebrew PATH
#set_brew_path_intel(){
#if [ "$(sysctl -n sysctl.proc_translated)" = "1" ]; then
#    local brew_path="/opt/homebrew/bin"
#else
#    local brew_path="/usr/local/homebrew/bin"
#fi
#local brew_path="/usr/local/homebrew/bin"
#export PATH="${brew_path}:${PATH}"
#}
#set_brew_path_intel


#prompt, user@host, date, cwd
#PS1="[\u@\h:\d:\w:]\$ "
#prompt, user@host, date and time, cwd, history number, (UID == 0)? "#":"$"
export PS1="[\u@\h:\D{%F %T}:\w:]\!\$ "

#set vi prompt mode, for emacs mode (default) use, set -o emacs
set -o vi
bind '"\t":menu-complete'

#SAP git infra token
export HOMEBREW_GITHUB_API_TOKEN=1a2a604b725df05011a1a2a60ec00ffc18ceb91a
export GITHUB_TOOLS_TOKEN=1a2a604b725df05011a1a2a60ec00ffc18ceb91a

#git bash Completion
cli_tools='/Library/Developer/CommandLineTools'
git_core="$cli_tools/usr/share/git-core"
git_completion="$git_core/git-completion.bash"
[ -x "$(which git)" ] && \
    [ -f "$git_completion" ] && \
    source "$git_completion"

## extended pattern matching operators are listed below, where pattern-list is a list containing one or more filenames, separated using the | character:
#*(pattern-list) – matches zero or more occurrences of the specified patterns
#?(pattern-list) – matches zero or one occurrence of the specified patterns
#+(pattern-list) – matches one or more occurrences of the specified patterns
#@(pattern-list) – matches one of the specified patterns
#!(pattern-list) – matches anything except one of the given patterns
shopt -s extglob    
##################################################


#source ~/.aliases
. ~/.aliases
export PATH=$PATH:/usr/local/go/bin

#rust
#source $HOME/.cargo/env

[ -f ~/.fzf.bash ] && source ~/.fzf.bash


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

source /Users/i500695/.docker/init-bash.sh || true # Added by Docker Desktop
alias ctags='/opt/homebrew/bin/ctags'

PATH=~/.console-ninja/.bin:$PATH