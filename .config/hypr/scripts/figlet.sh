#!/usr/bin/env bash
figlet -f smslant "Figlet"
echo
# ------------------------------------------------
# Script to create ascii font based header on user input
# and copy the result to the clipboard
# -----------------------------------------------------

read -p "Enter the text for ascii encoding: " mytext

if [ -f ~/figlet.txt ]; then
    touch ~/figlet.txt
fi

figlet -f smslant "$mytext" > ~/figlet.txt

lines=$(cat ~/figlet.txt)
rm ~/figlet.txt
wl-copy "$lines"

echo
echo "Result:"
echo "$lines"

echo "Text copied to clipboard!"
