#!/usr/bin/env bash
echo "Begin Python & Git setup:"

git config --global alias.lola "log --oneline --graph -20 --all"

pip install --upgrade pip
pip install --user -r .devcontainer/requirements.txt

echo "Python & Git setup complete."

echo "Starting noVNC setup:"

sudo apt-get update
sudo apt-get install -y novnc websockify
nohup /usr/share/novnc/utils/novnc_proxy \
	--vnc localhost:5901 \
	--listen 0.0.0.0:6080 \
	>/tmp/novnc.log 2>&1 &
