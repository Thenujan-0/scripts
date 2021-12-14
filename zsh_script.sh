#! /bin/sh

# bool function to test if the user is root or not (POSIX only)
is_user_root () { [ "$(id -u)" -eq 0 ]; }

if is_user_root; then
    echo " script has to be executed as user not root please execute without sudo">&2
    exit1
else
    
    if [ -f "/etc/arch-release" ]; then
      sudo pacman -S zsh
    else
      sudo apt install zsh
    fi

    user=$(whoami)
    echo "hello $user , how you doin"
    chsh -s /bin/zsh $user

    #zsh syntax highlighting
    mkdir ~/.scripts
    cd ~/.scripts
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
    echo "source ~/.scripts/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ~/.zshrc



    #zsh powerlevel10k
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
    echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc


    #zsh-autosuggestions
    git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/zsh-autosuggestions
    echo "source ~/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh">> .zshrc

    #bind ` to autosuggest-accept
    echo "bindkey '\`' autosuggest-accept" >> .zshrc

    echo "execution finished"
    exit 0 # implicit, here it serves the purpose to be explicit for the reader
fi

