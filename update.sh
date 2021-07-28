#! /bin/bash

echo 'updating emacs config...'
cd ~/emacs/
git pull
cd ~
rm -rf ~/.emacs.d/
cp ~/emacs ~/.emacs.d -r
echo 'emacs updates finished'
