#!/bin/bash
#=================================================
# Description: DIY script
# Lisence: MIT
# Author: 0xACE7
#=================================================

sed -i "s|DISTRIB_REVISION='%R'|DISTRIB_REVISION='R$(date +%Y.%m.%d)'|g" package/base-files/files/etc/openwrt_release
echo "DISTRIB_SOURCECODE='padavanonly'" >>package/base-files/files/etc/openwrt_release
sed -i 's/ImmortalWrt/Cmcc_Rax3000x/g' package/base-files/files/bin/config_generate
sed -i 's/lang="auto"/lang="zh_cn"/g' package/emortal/default-settings/files/99-default-settings
sed -i 's/ash/bash/g' package/base-files/files/etc/passwd
echo '# optimize udp' >>package/base-files/files/etc/sysctl.d/10-default.conf
echo 'net.core.rmem_max=26214400' >>package/base-files/files/etc/sysctl.d/10-default.conf
echo 'net.core.rmem_default=26214400' >>package/base-files/files/etc/sysctl.d/10-default.conf
echo 'net.core.wmem_max=26214400' >>package/base-files/files/etc/sysctl.d/10-default.conf
echo 'net.core.wmem_default=26214400' >>package/base-files/files/etc/sysctl.d/10-default.conf
echo 'net.core.netdev_max_backlog=2048' >>package/base-files/files/etc/sysctl.d/10-default.conf
sed -i '/interface}/d' feeds/packages/utils/ttyd/files/ttyd.init
sed -i 's|/bin/login|/bin/login -f root|g' feeds/packages/utils/ttyd/files/ttyd.config
sed -i 's/"终端"/"TTYD 终端"/g' feeds/luci/applications/luci-app-ttyd/po/zh_Hans/ttyd.po
sed -i '4 i\\t\t"order": 89,' feeds/luci/applications/luci-app-ttyd/root/usr/share/luci/menu.d/luci-app-ttyd.json
sed -i '4d' package/base-files/files/etc/profile
sed -i '4 i[ -f /etc/banner ] && cat /etc/banner | lolcat -h 0.30 -r -b' package/base-files/files/etc/profile
rm -rf package/base-files/files/etc/banner
wget --no-check-certificate -O package/base-files/files/etc/banner "https://raw.githubusercontent.com/0xACE8/m3d14tek/refs/heads/main/mt7981/rax3kz/laoliu/banner"
wget --no-check-certificate -O feeds/packages/utils/bash/files/etc/profile.d/30-sysinfo.sh "https://raw.githubusercontent.com/0xACE8/0p3nwrt-general/refs/heads/main/30-sysinfo.sh"
wget --no-check-certificate -O package/base-files/files/etc/uci-defaults/zzz-updata-settings "https://raw.githubusercontent.com/0xACE8/m3d14tek/main/mt7981/rax3kz/laoliu/zzz-updata-settings"

