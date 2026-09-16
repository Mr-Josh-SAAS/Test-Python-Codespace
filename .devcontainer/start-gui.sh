#!/usr/bin/env bash
set -u

if ! ss -ltn | grep -q ':5901 '; then
    nohup Xtigervnc :1 -geometry 1280x800 -depth 24 -SecurityTypes None \
        </dev/null >/tmp/vnc.log 2>&1 &
    disown
fi

for _ in {1..10}; do
    ss -ltn | grep -q ':5901 ' && break
    sleep 1
done

if ! pgrep -x fluxbox >/dev/null; then
    nohup fluxbox --display :1 </dev/null >/tmp/fluxbox.log 2>&1 &
    disown
fi

if ! ss -ltn | grep -q ':6080 '; then
    nohup /usr/share/novnc/utils/novnc_proxy --vnc localhost:5901 \
        --listen 0.0.0.0:6080 </dev/null >/tmp/novnc.log 2>&1 &
    disown
fi