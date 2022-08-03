
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

#export MYVIMRC="$HOME/.vimrc"
export PATH="$HOME/.local/bin:$PATH"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
export PATH="/usr/share/texlive/:$PATH"

export MPLCONFIGDIR="$HOME/.config/matplotlib"
# Virtual Env
export WORKON_HOME=~/.virtualenvs   # Optional
export VIRTUALENVWRAPPER_PYTHON=$(which python3)
#export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
#source ~/.local/bin/virtualenvwrapper.sh
source /usr/share/virtualenvwrapper/virtualenvwrapper.sh
# Digikam incos
export QT_QPA_PLATFORMTHEME="qt5ct"

# . ~/.bash_aliases
#
. ~/.bashrc
#source $MYVIMRC

# export TERM="xterm-256color"
# eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)

alias python='/usr/bin/python2.7'

export HISTTIMEFORMAT="%d/%m/%y %T "
