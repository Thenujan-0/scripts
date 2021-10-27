#! /bin/sh

sudo pacman -S zsh

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
git clone https://github.com/zsh-users/zsh-autosuggestions
echo "source ~/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh">> .zshrc

#bind ` to autosuggest-accept
echo "bindkey '`' autosuggest-accept" >> .zshrc

echo "execution finished"
