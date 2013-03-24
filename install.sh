#!/bin/sh
# © 2013 D MALAM
# Dotty Installer
# Symlink rc files into ~, removing existing

# Add needed dotfiles to this array
DOT_FILES="ackrc bin ctags editrc emacs.d gemrc gitconfig gitignore_global grc hgignore_global htoprc inputrc irbrc mostrc npmignore npmrc Rprofile ssh tmux.conf vim vimrc weechat"
ZDOT_FILES="zlogin zlogout zshrc"

# Start
echo "\n\n\033[0;32mInstalling Dotty...\033[0m\n"

if [ $(uname) == Darwin ]; then
   echo "MacOSX detected..."
# FIXME: Actually test for debian like distros
elif [ $(lsb_release -is) == Ubuntu ]; then
   echo "Ubuntu detected..."
   DOT_FILES="$DOT_FILES toprc"
else
    echo "OS not supported"
    exit 1
fi

# Symlink $1 into $HOME, removing if already exists
function link {
    SRC="$1"
    DST="$2"

    if [ ! -s "$SRC" ]; then
        echo "\033[0;33m$SRC does not exist.\033[0m"
        echo "\nExiting..."
        exit 1
    fi

    if [ -s "$DST" ]; then
        echo "\033[0;33mExisiting $DST detected. Not installed...\033[0m"
    else
        ln -s $SRC $DST
        echo "\033[0;32mSymlinked $SRC -> $DST\033[0m"
    fi
}
# Loop over all dotfiles
for RC in $DOT_FILES; do
    link "$PWD/$RC" "$HOME/.$RC"
done

for ZRC in $ZDOT_FILES; do
    link "$PWD/zsh/$ZRC" "$HOME/.$ZRC"
done

# For MC
if [ ! -d "$HOME/.config" ]; then
    mkdir "$HOME/.config"
fi
link "$PWD/mc" "$HOME/.config/mc"

# Install sublime
# ln -s "$PWD/sublime" ~/Library/Application\ Support/Sublime\ Text\ 2/Packages/User

# End
echo "\n\033[0;32mDotty done. Restart your shell.\033[0m"
