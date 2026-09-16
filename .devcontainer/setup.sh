#!/usr/bin/env bash
echo "Begin Python & Git setup:"

git config --global alias.lola "log --oneline --graph -20 --all"

pip install --upgrade pip
pip install --user -r .devcontainer/requirements.txt

echo "Python & Git setup complete."

echo "Starting noVNC setup:"

sudo apt-get update
sudo apt-get install -y fluxbox novnc tigervnc-standalone-server websockify
