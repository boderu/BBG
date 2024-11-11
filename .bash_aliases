alias ll='eza -al --group --color=always --group-directories-first --icons --git --extended'
alias llt='eza -al --group --color=always --group-directories-first --icons --git --extended --tree'
alias la='eza -a --group --color=always --group-directories-first --icons --git --extended'
alias l='eza -l --group --color=always --group-directories-first --icons --git --extended'
alias lt='eza -l --group --color=always --group-directories-first --icons --git --extended --tree'
#alias ll='ls -Alh --dereference-command-line-symlink-to-dir'
#alias la='ls -A --dereference-command-line-symlink-to-dir'
#alias l='ls -lh --dereference-command-line-symlink-to-dir'
alias h='history'
#alias i='inxi --full --ip --uuid --label --usb --raid --partitions-full --memory'
alias i='inxi --full --ip --uuid --label --usb --raid --memory'
alias e='micro'
alias b='br --sort-by-type-dirs-first --permissions --no-hidden --show-git-info --git-ignored --show-root-fs --no-trim-root'
alias c='batcat'
alias scanip="nmap -sn 192.168.1.0/24 | awk '/for/ {print substr(\$0,22)}'"
alias gitlog='git log --pretty=format:"%h %s" --graph'
alias lg='lazygit'
#alias easy="cd $HOME/easy-diffusion && ./start.sh"
alias x='exit'
#alias o8='ollama run llama3.1:8b'
#alias o70='ollama run llama3.1:70b'