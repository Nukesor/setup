if $server; then

    mkdir -p /root/.ssh
    chmod 700 /root/.ssh

    mkdir -p /home/nuke/.ssh
    chmod 700 /home/nuke/.ssh

    cp ./files/keys/nuke.pub /root/.ssh/authorized_keys
    cp ./files/keys/nuke.pub /home/nuke/.ssh/authorized_keys

    chmod 600 /root/.ssh/authorized_keys
    chmod 600 /home/nuke/.ssh/authorized_keys

    cp ./files/sshd_config /etc/ssh/sshd_config

    # SSH setup
    systemctl enable sshd.service
fi
