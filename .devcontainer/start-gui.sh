#!/usr/bin/env bash
set -u

if ! ss -ltn | grep -q ':5901 '; then
    nohup setsid Xtigervnc :1 -geometry 1280x800 -depth 24 -SecurityTypes None \
        </dev/null >/tmp/vnc.log 2>&1 &
    vnc_pid=$!
fi

for _ in {1..10}; do
    if [[ -n "${vnc_pid:-}" ]] && ! kill -0 "$vnc_pid" 2>/dev/null; then
        break
    fi
    ss -ltn | grep -q ':5901 ' && break
    sleep 1
done

if ! ss -ltn | grep -q ':5901 '; then
    echo "TigerVNC failed to start; see /tmp/vnc.log" >&2
    cat /tmp/vnc.log >&2
    exit 1
fi

if ! pgrep -x fluxbox >/dev/null; then
    nohup setsid fluxbox --display :1 </dev/null >/tmp/fluxbox.log 2>&1 &
fi

if ! ss -ltn | grep -q ':6080 '; then
    nohup setsid /usr/share/novnc/utils/novnc_proxy --vnc localhost:5901 \
        --listen 0.0.0.0:6080 </dev/null >/tmp/novnc.log 2>&1 &

    for _ in {1..10}; do
        ss -ltn | grep -q ':6080 ' && break
        sleep 1
    done

    if ! ss -ltn | grep -q ':6080 '; then
        echo "noVNC failed to start; see /tmp/novnc.log" >&2
        cat /tmp/novnc.log >&2
        exit 1
    fi
fi