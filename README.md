Vim
========

Vim for OSX

## About this mvim setup

I keep vi and mvim seperate, so this creates ~/mvim and installs everything there 
and creates ~/bin/mvim which is a script that points to ~/mvim. It won't overwrite your ~/.vimrc
it will create a new vimrc and gvimrc in ~/mvim/vimrc and ~/mvim/gvimrc.


## First time install for Mac OS X

1. Install macvim if you don't already have it and assuming you have homebrew

   ```
   brew install macvim
   ```

2. Clone this repository from your home dir:

    ```
    git clone https://github.com/jasonswat/mvim.gitm
    ````

3. Run the install script:

    ```
    cd ~/mvim
    ./install.sh
    ````

4. Launch mvim 
  
     ```
    ./bin/mvim
    ```
