#!/bin/bash

# 下载直连域名列表 direct-list.txt
wget -N -P /www/mosdns/ https://raw.githubusercontent.com/Loyalsoldier/v2ray-rules-dat/release/direct-list.txt

# 下载apple-cn域名列表 apple-cn.txt
wget -N -P /www/mosdns/ https://raw.githubusercontent.com/Loyalsoldier/v2ray-rules-dat/release/apple-cn.txt

# 下载代理域名列表 proxy-list.txt
wget -N -P /www/mosdns/ https://raw.githubusercontent.com/Loyalsoldier/v2ray-rules-dat/release/proxy-list.txt

# 下载ip列表 cn.dat
wget -N -O /www/mosdns/ip.dat https://raw.githubusercontent.com/Loyalsoldier/geoip/release/cn.dat

# 下载广告屏蔽规则
wget -N -P /www/mosdns/ https://raw.githubusercontent.com/Loyalsoldier/v2ray-rules-dat/release/reject-list.txt

# ip.dat 数据包解包为 ip_cn.txt
mosdns4 v2dat unpack-ip -o /www/mosdns /www/mosdns/ip.dat:cn

# 重启mosdns
mosdns service restart

