# ===============================================================
# 1. Environment & Path
# ===============================================================
export ZSH="$HOME/.oh-my-zsh"
export PATH="$PATH:/home/tal/.local/bin"
export EDITOR='nvim'

# ===============================================================
# 2. Theme & Visuals (Powerlevel10k)
# ===============================================================
ZSH_THEME="powerlevel10k/powerlevel10k"
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# ===============================================================
# 3. Plugins Configuration
# ===============================================================
# NOTE: fzf-tab must be loaded BEFORE syntax-highlighting
plugins=(
    git
    vi-mode
    autojump
    sudo
    you-should-use
    zsh-bat
    zsh-autosuggestions
    fzf
    fzf-tab                 # The "chooser" for ls/cd/etc.
    zsh-syntax-highlighting # Must be last
)

# Vi-mode settings
VI_MODE_SET_CURSOR=true

# Load Oh My Zsh
source $ZSH/oh-my-zsh.sh

# ===============================================================
# 4. FZF Settings (Fuzzy Finding)
# ===============================================================

# Updated for older FZF versions
export FZF_CTRL_T_OPTS="
  --preview 'batcat -n --color=always {}'
  --bind 'ctrl-/:change-preview-window(down|hidden|)'"

# If you want to skip folders like .git, we do it via the base command instead:
export FZF_DEFAULT_COMMAND='find . -maxdepth 5 -not -path "*/.*"'

# --- FZF-TAB Settings (The "Chooser") ---
# Give a preview of the directory content when completing 'cd'
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'

# Give a preview of files for any other command (ls, cat, vim, etc.)
zstyle ':fzf-tab:complete:*' fzf-preview 'batcat --color=always --line-range :500 $realpath 2>/dev/null || eza -1 --color=always $realpath'

# ===============================================================
# 5. Aliases
# ===============================================================
# Modern replacements
alias ls='eza'
alias ll='eza -la'
alias vim='nvim'

# Git dotfiles alias
alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"

# Pager settings
export MANPAGER="sh -c 'col -bx | batcat -l man -p'"
export MANROFFOPT="-c"

# ===============================================================
# 6. External Tools Initialisation
# ==============================================================
#

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# Load local secrets (ignored by Git)
if [[ -f "$HOME/.env_secrets" ]]; then
    source "$HOME/.env_secrets"
fi


# Run this in background so it doesn't block shell startup
(
    if [[ -n "$KITTY_WINDOW_ID" ]]; then
        WALLPAPER_DIR="/home/tal/Pictures/wallpapers/kitty"
        files=($WALLPAPER_DIR/*(N))
        # Ensure files exist to avoid error
        if (( ${#files} > 0 )); then
            random_file="${files[RANDOM % ${#files[@]} + 1]}"
            kitty @ set-background-image "$random_file"
        fi
    fi
) &!

# Random Kitty background
shuffle() {
  local random_file
  random_file="$(find /home/tal/Pictures/wallpapers/kitty -type f | shuf -n 1)"
  echo "Random file: ${random_file}"
  kitty @ set-background-image "$random_file"
}
