#!/usr/bin/env bash
echo "Begin Python & Git setup:"

git config --global alias.lola "log --oneline --graph -20 --all"

pip install --upgrade pip
pip install --user -r .devcontainer/requirements.txt

echo "Python & Git setup complete."

echo "Starting noVNC setup:"

sudo apt-get update -o Dir::Etc::sourcelist=/etc/apt/sources.list.d/debian.sources -o Dir::Etc::sourceparts=- 
sudo apt-get install -y npm

