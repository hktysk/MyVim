# MyVim
This is my vim settings

Installation
```bash
$ mkdir ~/.vim ~/.vim/bundle ~/.config
$ git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
$ git clone [this repository]
$ cd [this repository]
$ cp vimrc /etc/vimrc
$ cp -R coc ~/.config/
```

Vim Settings
```bash
:NeoBundleInstall
:CocInstall coc-tsserver
:CocInstall coc-phpls
:CocInstall cpc-html
:CocInstall coc-snippets
:CocInstall coc-lists
```
