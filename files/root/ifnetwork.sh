#!/bin/bash

sleep 5

#检测网络链接畅通
function network()
{
    #超时时间
    local timeout=1

    #目标网站
    local target=www.baidu.com

    #获取响应状态码
    local ret_code=`curl -I -s --connect-timeout ${timeout} ${target} -w %{http_code} | tail -n1`

    if [ "x$ret_code" = "x200" ]; then
        #网络畅通
        return 1
    else
        #网络不畅通
        return 0
    fi

    return 0
}

network
if [ $? -eq 0 ];then
	echo "网络不畅通，请检查网络设置！"
	sleep 10
	/etc/uci-defaults/ifnetwork.sh
	exit -1
fi

echo "网络畅通，你可以上网冲浪！"

# 配置文件下载解压
#wget http://192.168.10.2/Openwrt15-bu-all.tar.gz
#gzip -d -c /root/Openwrt15-bu-all.tar.gz | tar -xf - -C /

# 追加计划任务
cat << "EOF" >> /var/spool/cron/crontabs/root
15 1 * * 5 //root/openwrt-backup.sh
5 2 * * 5 //root/mosdns-down.sh
*/10 * * * * /root/DenyPwdHack.sh
EOF

#重启crontab 服务
service cron restart

#删除脚本
rm -rf /etc/uci-defaults/ifnetwork.sh

exit 0
