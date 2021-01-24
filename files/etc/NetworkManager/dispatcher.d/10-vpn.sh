#!/bin/zsh
echo "\n"
echo "--------------------------------------------" >> /tmp/roflcopter
echo "$(date +%Y-%m-%dT%H:%M:%S) START" >> /tmp/roflcopter
echo "args: $@" >> /tmp/roflcopter
interface="$1"
action="$2"
echo ">>$action<<" >> /tmp/roflcopter

if [ "$interface" = "wlp3s0" ]; then
    case $action in
        up)
            echo "Restarting wg-quick@vpn" >> /tmp/roflcopter
            systemctl restart wg-quick@vpn
            ;;
        down)
            echo "Stopping wg-quick@vpn" >> /tmp/roflcopter
            systemctl stop wg-quick@vpn
            ;;
    esac
fi

echo "\n" >> /tmp/roflcopter
#printenv >> /tmp/roflcopter
