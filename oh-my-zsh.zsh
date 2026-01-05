
[[ ! -f $ZSH/oh-my-zsh.sh ]] || source $ZSH/oh-my-zsh.sh

brew_dir="/home/linuxbrew/.linuxbrew/share"
root_dir="/usr/share/zsh/plugins"

# Activate ZSH plugins installed with brew
[[ ! -f $brew_dir/zsh-autosuggestions/zsh-autosuggestions.zsh ]] || source $brew_dir/zsh-autosuggestions/zsh-autosuggestions.zsh
[[ ! -f $brew_dir/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]] || source $brew_dir/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Activate ZSH plugins installed at root
[[ ! -f $root_dir/zsh-autosuggestions/zsh-autosuggestions.zsh ]] || source $root_dir/zsh-autosuggestions/zsh-autosuggestions.zsh
[[ ! -f $root_dir/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]] || source $root_dir/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
