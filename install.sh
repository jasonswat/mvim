#!/bin/sh

# Create the mvim script 
echo "#!/bin/sh" >> ~/bin/mvim
echo "/usr/local/bin/mvim -u ~/mvim/vimrc -U ~/mvim/gvimrc $1" >> ~/bin/mvim

# install the bundler pluguns
vim +BundleInstall +qall

# Install the latest Pathogen
mkdir -p ~/mvim/autoload ~/mvim/bundle && \
curl -LSso ~/mvim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

pathogen_plugins="
https://github.com/gmarik/vundle.git
https://github.com/scrooloose/syntastic.git
https://github.com/scrooloose/nerdtree.git
https://github.com/vim-ruby/vim-ruby.git
https://github.com/rkulla/pydiction.git

# configuration section
# for pydictation plugin
echo "let g:pydiction_location = '/Users/xjs5/mvim/bundle/pydiction/complete-dict'" >> /Users/xjs5/mvim/vimrc
