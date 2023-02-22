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
    mkdir ~/.zshPlugins
    cd ~/.zshPlugins
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
    echo "source ~/.zshPlugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ~/.zshrc



    #zsh powerlevel10k
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.zshPlugins/powerlevel10k
    echo 'source ~/.zshPlugins/powerlevel10k/powerlevel10k.zsh-theme' >> ~/.zshrc


    #zsh-autosuggestions
    git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.zshPlugins/zsh-autosuggestions
    echo "source ~/.zshPlugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh" >> ~/.zshrc

    #bind ` to autosuggest-accept
    echo "bindkey '\`' autosuggest-accept" >> ~/.zshrc

    #to stop the issues that will be caused by console output of neofetch
    echo "typeset -g POWERLEVEL9K_INSTANT_PROMPT=off" >> ~/.zshrc
    
    # to save zsh history
    echo "HISTFILE=~/.zsh_history" >> ~/.zshrc
    echo "HISTSIZE=10000" >> ~/.zshrc
    echo "SAVEHIST=10000" >> ~/.zshrc
    echo "setopt appendhistory" >> ~/.zshrc

    echo "neofetch" >> ~/.zshrc

    echo "execution finished"
    exit 0 # implicit, here it serves the purpose to be explicit for the reader
fi

