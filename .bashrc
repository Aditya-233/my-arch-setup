# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# -----------------------------------------------------
# HISTORY CONTROL
# -----------------------------------------------------
shopt -s histappend
HISTCONTROL=ignoreboth
HISTSIZE=32768
HISTFILESIZE="${HISTSIZE}"

# -----------------------------------------------------
# AUTOCOMPLETION
# -----------------------------------------------------
if [[ ! -v BASH_COMPLETION_VERSINFO && -f /usr/share/bash-completion/bash_completion ]]; then
  source /usr/share/bash-completion/bash_completion
fi

# -----------------------------------------------------
# EDITOR & ENVIRONMENT
# -----------------------------------------------------
export EDITOR="nano"
export VISUAL="nano"
export SUDO_EDITOR="$EDITOR"
export BAT_THEME="ansi"

# -----------------------------------------------------
# STARSHIP PROMPT (Must be last)
# -----------------------------------------------------
if command -v starship &> /dev/null; then
  eval "$(starship init bash)"
fi
