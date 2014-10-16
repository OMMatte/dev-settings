export PGHOST=localhost
export PATH=/usr/gcc-4.8.1/bin:$PATH
alias ls="ls -GFh"
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
export GREP_OPTIONS="--color"

# Source a git completion script
if [ -f $HOME/bin/git-completion.sh ]; then
       . $HOME/bin/git-completion.sh
else
  echo "Could not find git completion script"
fi

function we_are_in_git_work_tree {
    git rev-parse --is-inside-work-tree &> /dev/null
}

function parse_git_status {
    if we_are_in_git_work_tree
    then 
    local ST=$(git status --short 2> /dev/null)
    if [ -n "$ST" ]
    then echo -en ${COLRED}
    else echo -en ${COLGREEN}
    fi
    fi
}


COLGREEN="\033[m"
COLRED="\033[1;31m"
COLCLEAR="\[\033[0m\]"
 

source ~/bin/git-prompt.sh
# Display the current git branch in the command prompt
export PS1='\[\033[36m\]\u\[\033[33;1m\]@\[\033[m\]\h:\[\033[33;1m\]\W$(__git_ps1 "\[\033[m\] (\[$(parse_git_status)\]%s\[\e[0m\])")\[\033[m\]\$ '


# WORK RELATED

export WAPI_LOG_KEY=/Users/mathiaslindblom/Documents/mathias_wapi_log.pem

Host dev-server99
HostName ec2-54-216-140-207.eu-west-1.compute.amazonaws.com
User ubuntu

alias buildwapi='mvn install && scp /Users/mathiaslindblom/Trustly/trustly-commons/target/trustly-commons-1.0.jar target/wapi-1.0.jar dev-server99:/opt/wapi/jars/worker12/ && ssh dev-server99 '\''/opt/wapi/bin/worker.sh 12 mathias'\'''
alias getorder="~/bin/getorderbyid -r -i"
alias getdevorder="~/bin/fetchlastorder ubuntu@ec2-54-216-140-207.eu-west-1.compute.amazonaws.com ~/LOGS"


# AUTOMATICALLY ADDED


##
# Your previous /Users/mathiaslindblom/.bash_profile file was backed up as /Users/mathiaslindblom/.bash_profile.macports-saved_2014-03-16_at_11:36:56
##

# MacPorts Installer addition on 2014-04-17_at_11:54:08: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.


# Setting PATH for Python 3.4
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.4/bin:${PATH}"
export PATH
