setup-dns
apk update
apk -U upgrade
reboot
apk add curl docker docker-cli-compose git
rc-update add docker default
rc-update add docker boot
service docker start
git clone https://github.com/SiestaCat/vps-proxy.git
cd vps-proxy
cp .env.tmpl .env
# edit .env
docker compose up -d --build

# How to test it:

curl \
  --proxy "https://proxy.example.com:443" \
  --proxy-user "proxyuser:change-me" \
  https://ifconfig.me