#!/bin/bash

# Link all the dotfiles into the home directory.
# This won't overwrite files already there.
# Run it with dotfiles as the working directory.

ln -s `pwd`/.* ~/
rm ~/.git # remove that pesky symlink
