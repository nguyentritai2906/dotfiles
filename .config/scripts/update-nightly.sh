#!/usr/bin/env bash

curl -L https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage -o /tmp/nv;
chmod +x /tmp/nv;
sudo mv /tmp/nv /usr/local/bin;
