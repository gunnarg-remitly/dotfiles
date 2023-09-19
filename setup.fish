#!/opt/homebrew/bin/fish
#
# get tools I like, link files to where they need to be, make public keys
# restart fish
#
# backup .gitconfig
mv $HOME/.gitconfig $HOME/.gitconfig.bak
# setup .gitconfig
ln -s (echo (cd (dirname .gitconfig) && pwd)/(basename .gitconfig)) $HOME/.gitconfig
# install m1 compatible openjdk
brew tap mdogan/zulu
brew install --cask zulu-jdk11
# install gradle
brew install gradle
#install pyenv for python environments
brew install pyenv
# install aws cli
brew install awscli
# generate an ssh key for github etc.
ssh-keygen -t rsa 
# remind user to put the public key into github
cat $HOME/.ssh/id_rsa.pub
read -p 'echo "put the public key into https://github.com/settings/keys"; echo "authorize sso"; echo "press any key to continue"' blah
# install oh my fish
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish
# install fortune
brew install fortune
# install cowsay
brew install cowsay
# backup default fish.config
mv ~/.config/fish/config.fish $HOME/.config/fish/config.fish.bak
# backup default fish_variables
mv ~/.config/fish/fish_variables $HOME/.config/fish/fish_variables.bak
# backup default fish functions/
mv ~/.config/fish/functions/ $HOME/.config/fish/functions.bak
# symlink dotfiles fish stuff
ln -s (echo (cd (dirname config.fish) && pwd)/(basename config.fish)) $HOME/.config/fish/config.fish
ln -s (echo (cd (dirname fish_variables) && pwd)/(basename fish_variables)) $HOME/.config/fish/fish_variables
ln -s (echo (cd (dirname config.fish) && pwd)/(basename functions)) $HOME/.config/fish/functions
# restart fish
fish
# install fisher
 curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher    
 # install fish nvm
 fisher install jorgebucaran/nvm.fish
 # install node 16
 nvm install 16
 # install yarn
 brew install yarn
