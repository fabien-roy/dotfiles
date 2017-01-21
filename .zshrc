# Path to your oh-my-zsh installation.
export ZSH=/home/fabien/.oh-my-zsh

# theme
ZSH_THEME="geometry/geometry"

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# other settings
# DISABLE_AUTO_UPDATE="true"
# export UPDATE_ZSH_DAYS=13
# DISABLE_LS_COLORS="true"
# DISABLE_AUTO_TITLE="true"
# ENABLE_CORRECTION="true"
# COMPLETION_WAITING_DOTS="true"
# DISABLE_UNTRACKED_FILES_DIRTY="true"
# HIST_STAMPS="mm/dd/yyyy"
# ZSH_CUSTOM=/path/to/new-custom-folder

# plugins
plugins=(bower, colorize, debian, docker-compose, docker, git, gulp, heroku, man, postgres. rails, rake, sudo, tmux)

source $ZSH/oh-my-zsh.sh

DEFAULT_USER="fabien"

# For aliases
source $HOME/.zsh_aliases

# For Powerline
export TERM=xterm-256color
