#!/bin/bash

# 备份本地all
rm -rf /mnt//backup/*

#tar -czvf /mnt/backup/Openwrt15-le-all-$(date +%Y%m%d%H%M).tar.gz \

7z a -mhe -spf /mnt/backup/Openwrt15-le-all-$(date +%Y%m%d%H%M).7z \
/root/*.sh \
/etc/AdGuardHome.yaml \
/etc/dnsmasq.conf \
/etc/hosts \
/etc/config/AdGuardHome \
/etc/config/cloudflarespeedtest \
/etc/config/dhcp \
/etc/config/dropbear \
/etc/config/filebrowser \
/etc/config/firewall \
/etc/config/keepalived \
/etc/config/mosdns \
/etc/config/passwall \
/etc/config/shadowsocksr \
/etc/config/network \
/etc/config/upnpd \
/etc/config/zerotier \
/etc/ssrplus/ \
/etc/keepalived/keepalived.conf \
/etc/mosdns/ \
/www/mosdns/ \
/var/spool/cron/crontabs/root \
/usr/share/passwall/rules/direct_ip \
/usr/share/passwall/rules/direct_host

# 7z x archives.7z -spf  解压到原路径
