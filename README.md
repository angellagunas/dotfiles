# dotfiles

# Requeriments
[Vundle](https://github.com/gmarik/Vundle.vim)
[git](https://git-scm.com/)
`npm install -g prettier`
`aurman -S nerd-fonts-complete-mono-glyphs`

```
aurman -S nerd-fonts-complete
rm -rf ~/.vim
mkdir ~/.vim
cp ./.vimrc ~/.vim
cp ./colors ~/.vim/colors -r
cd ~/.vim && ln -s ~/.vim/.vimrc ~/.vimrc
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
```
