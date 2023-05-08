#!/bin/bash

echo "Downloading Hack-Nerd-Font"
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/Hack.zip -O /tmp/Hack.zip
unzip /tmp/Hack.zip -d ~/.local/share/fonts
fc-cache -fv
rm /tmp/Hack.zip
echo "Done!"
