# MyVim
This is my vim settings

Installation
```bash
$ git clone [this repository]
$ cd [this repository]
$ cp vimrc /etc/vimrc
$ mkdir ~/.vim
$ cp -R bundle ~/.vim/
$ mkdir ~/.config
$ cp -R coc ~/.config/
```

Vim Settings
```bash
:NeoBundleUpdate
:CocUpdate
:CocInstall coc-tsserver
:CocInstall coc-phpls
:CocInstall cpc-html
:CocInstall coc-snippets
:CocInstall coc-lists
```
