#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP
sed -i 's/192.168.1.1/192.168.10.12/g' package/base-files/files/bin/config_generate

# 取消 Lean 大登陆密码
sed -i 's/^\(.*99999\)/#&/' package/lean/default-settings/files/zzz-default-settings

# Modify system hostname（FROM OpenWrt CHANGE TO OpenWrt-Bu）
#sed -i "s/OpenWrt/OpenWrt by Bu $(TZ=UTC-8 date "+%y.%m.%d") @/g" package/lean/default-settings/files/zzz-default-settings

#git clone https://github.com/xiaoqingfengATGH/p7zip-gcc17.git package/p7zip
