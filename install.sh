setup-dns
apk update
apk -U upgrade
reboot
apk add curl docker git
rc-update add docker default
rc-update add docker boot
service docker start
ssh-keygen