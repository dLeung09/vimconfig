#!/bin/bash

INSTALL_DIR="${1:-$HOME}"

VIM_DIR="$INSTALL_DIR/.vim"
VIM_BUNDLE_DIR="$VIM_DIR/bundle"
VIM_AUTOLOAD_DIR="$VIM_DIR/autoload"

TMUX_DIR="$INSTALL_DIR/.tmux"

WIN_VIM_DIR="$INSTALL_DIR/vimfiles"

# Set the current working directory of this script (https://stackoverflow.com/a/246128)
#   Should be inside the vimconfig/ directory, but that could be anywhere
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

ECHO_SUCCESS="echo ...Success"

### INSTALL VIM CONFIG ###

# Check for existing .vimrc
if [ -a "$INSTALL_DIR"/.vimrc ] ; then

    # Backup any old config files
    BACKUP="$INSTALL_DIR/.vimrc_backup"
    if [[ -f $BACKUP ]] ; then
        i=0
        while [[ -f "$BACKUP"_"$i" ]] ; do
            let i++
        done
        BACKUP="$BACKUP"_"$i"
    fi

    echo "Backing up old .vimrc file to $BACKUP"

    cp "$INSTALL_DIR"/.vimrc "$BACKUP" && $ECHO_SUCCESS
    echo ""

else

    # Create new .vimrc
    touch "$INSTALL_DIR/.vimrc"

fi

# Update the vimrc to point to the version controlled file
echo "Sourcing version controlled vimrc file"
echo "source $SCRIPT_DIR/vimrc" > "$INSTALL_DIR"/.vimrc && $ECHO_SUCCESS
echo ""

### INSTALL VIM PLUGINS ###

# Install pathogen for plugin management
echo "Installing pathogen"
echo ""

mkdir -p "$VIM_DIR"/autoload "$VIM_DIR"/bundle && curl -LSso "$VIM_DIR"/autoload/pathogen.vim https://tpo.pe/pathogen.vim && $ECHO_SUCCESS

if [[ "$OSTYPE" == "msys" ]]; then

    echo "Copying '$VIM_DIR/bundle' and '$VIM_DIR/autoload' to '$WIN_VIM_DIR/'"
    cp -r "$VIM_BUNDLE_DIR" "$WIN_VIM_DIR/"
    cp -r "$VIM_AUTOLOAD_DIR" "$WIN_VIM_DIR/"
    echo ""

fi

# Install NERDTree (file system navigation)
echo "Installing Plugins"
echo ""

git clone https://github.com/scrooloose/nerdtree.git "$VIM_BUNDLE_DIR"/nerdtree && echo "... NERDTree"
echo ""

### INSTALL VIM SYNTAX FILES ###

echo "Installing Syntax files"
echo ""

# Typescript
git clone https://github.com/leafgarland/typescript-vim.git "$VIM_BUNDLE_DIR"/typescript-vim && echo "... Typescript"
echo ""

# Go
git clone https://github.com/fatih/vim-go.git "$VIM_BUNDLE_DIR"/vim-go && echo "... Go"
echo ""

### INSTALL TMUX CONFIG ###

echo "Configuring tmux"
echo ""

# Create a tmux directory for holding command history and reset script
mkdir -p "$TMUX_DIR" && echo "... tmux directory created"

# Copy reset script to tmux directory
cp "$SCRIPT_DIR"/tmux/reset "$TMUX_DIR"/reset && echo "... reset file set"

# Copy configuration file to appropriate location
cp "$SCRIPT_DIR"/tmux/tmux.conf ~/.tmux.conf && echo "... configuration file set"

### INSTALL TMUX THEME ###

# Install the tmux themepack; theme is specified in the config
echo "Installing tmux theme"
git clone https://github.com/jimeh/tmux-themepack.git "$INSTALL_DIR"/.tmux-themepack && echo "... Success"

### GIT ALIASES

echo "Setting git aliases"

git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.st status
git config --global alias.unstage 'reset HEAD --'
