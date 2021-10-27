#! /bin/sh

sudo pacman -S zsh

user=$(whoami)
echo "hello $user , how you doin"
chsh -s /bin/zsh $user

#zsh syntax highlighting
mkdir ~/.scripts
cd ~/.scripts
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git




#zsh powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc
