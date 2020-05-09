
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

export PATH="$HOME/.local/bin:$PATH"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

# Virtual Env
export WORKON_HOME=~/.virtualenvs   # Optional
export VIRTUALENVWRAPPER_PYTHON=$(which python3)
source ~/.local/bin/virtualenvwrapper.sh

# Digikam incos
export QT_QPA_PLATFORMTHEME="qt5ct"
