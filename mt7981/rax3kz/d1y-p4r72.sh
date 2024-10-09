#!/bin/bash
#=================================================
# Description: DIY script
# Lisence: MIT
# Author: 0xACE7
#=================================================
# Modify default IP
sed -i 's/192.168.6.1/192.168.177.1/g' package/base-files/files/bin/config_generate
sed -i "s/ip6assign='60'/ip6assign='64'/g" package/base-files/files/bin/config_generate
sed -i "s/globals.ula_prefix='auto'/packet_steering='1'/g" package/base-files/files/bin/config_generate
sed -i 's/2:-dhcp/2:-pppoe/g' package/base-files/files/lib/functions/uci-defaults.sh
sed -i "s|DISTRIB_REVISION='%R'|DISTRIB_REVISION='R$(date +%Y.%m.%d)'|g" package/base-files/files/etc/openwrt_release
echo "DISTRIB_SOURCECODE='padavanonly'" >>package/base-files/files/etc/openwrt_release

# Modify Hostname
sed -i 's/ImmortalWrt/RAX3000Z_Pro/g' package/base-files/files/bin/config_generate

# Change language=auto to zh_cn
sed -i 's/lang="auto"/lang="zh_cn"/g' package/emortal/default-settings/files/99-default-settings

# Change ash to bash
sed -i 's/ash/bash/g' package/base-files/files/etc/passwd

# Boost UDP
echo '# optimize udp' >>package/base-files/files/etc/sysctl.d/10-default.conf
echo 'net.core.rmem_max=26214400' >>package/base-files/files/etc/sysctl.d/10-default.conf
echo 'net.core.rmem_default=26214400' >>package/base-files/files/etc/sysctl.d/10-default.conf
echo 'net.core.wmem_max=26214400' >>package/base-files/files/etc/sysctl.d/10-default.conf
echo 'net.core.wmem_default=26214400' >>package/base-files/files/etc/sysctl.d/10-default.conf
echo 'net.core.netdev_max_backlog=2048' >>package/base-files/files/etc/sysctl.d/10-default.conf

# Change luci list name
#sed -i '65s/^#//g' feeds/packages/utils/ttyd/files/ttyd.init
sed -i '/interface}/d' feeds/packages/utils/ttyd/files/ttyd.init
sed -i 's|/bin/login|/bin/login -f root|g' feeds/packages/utils/ttyd/files/ttyd.config
sed -i 's/"终端"/"TTYD 终端"/g' feeds/luci/applications/luci-app-ttyd/po/zh_Hans/ttyd.po
sed -i '4 i\\t\t"order": 89,' feeds/luci/applications/luci-app-ttyd/root/usr/share/luci/menu.d/luci-app-ttyd.json

# MulteWAN
sed -i '412d' feeds/luci/applications/luci-app-mwan3/po/zh_Hans/mwan3.po
sed -i '412 i\msgstr "MWAN 状态"' feeds/luci/applications/luci-app-mwan3/po/zh_Hans/mwan3.po
sed -i '414 i\msgid "MultiWAN Manager2"\nmsgstr "MWAN 管理"\n' feeds/luci/applications/luci-app-mwan3/po/zh_Hans/mwan3.po
sed -i '415G' feeds/luci/applications/luci-app-mwan3/po/zh_Hans/mwan3.po
sed -i '46d' feeds/luci/applications/luci-app-mwan3/root/usr/share/luci/menu.d/luci-app-mwan3.json
sed -i '46 i\\t\t"title": "MultiWAN Manager2",' feeds/luci/applications/luci-app-mwan3/root/usr/share/luci/menu.d/luci-app-mwan3.json

# samba4
#sed -i 's/nas/services/g' feeds/luci/applications/luci-app-samba4/root/usr/share/luci/menu.d/luci-app-samba4.json

# change navbar 'VPN' to 'NAT'
sed -i 's/msgstr "VPN"/msgstr "NAT"/g' luci/modules/luci-base/po/zh_Hans/base.po

# Change to my banner
#sudo rm package/emortal/default-settings/files/openwrt_banner
#wget https://raw.githubusercontent.com/0xACE8/m3d14tek/main/mt7986/ax6k/banner -O package/emortal/default-settings/files/openwrt_banner
sed -i 's\[ -f /etc/banner ] && cat /etc/banner\[ -f /etc/banner ] && cat /etc/banner | lolcat -h 0.30 -r -b\g' feeds/package/base-files/files/etc/profile
sudo rm package/base-files/files/etc/banner
wget --no-check-certificate https://raw.githubusercontent.com/0xACE8/0p3nwrt-general/main/cmcc_rax3000z_pro/banner -O package/base-files/files/etc/banner

# Argon upgraded to Xiaomi theme
sed -i 's/"Argon 主题设置"/"主题设置"/g' feeds/ace8/luci-app-argon-config/po/zh_Hans/argon-config.po
#rm -rf feeds/ace8/luci-theme-argon/htdocs/luci-static/argon/img/bg1.jpg
#wget --no-check-certificate -O feeds/ace8/luci-theme-argon/htdocs/luci-static/argon/img/bg1.jpg "https://raw.githubusercontent.com/0xACE8/m3d14tek/main/mt7986/ax6k/argone/img/bg1.jpg"
#rm -rf feeds/ace8/luci-app-argon/htdocs/luci-static/argon/favicon.ico
#wget --no-check-certificate -O feeds/ace8/luci-theme-argon/htdocs/luci-static/argon/favicon.ico "https://raw.githubusercontent.com/0xACE8/m3d14tek/main/mt7986/ax6k/argone/favicon.ico"
#rm -rf feeds/ace8/luci-theme-argon/htdocs/luci-static/argon/img/argon.svg
#wget --no-check-certificate -O feeds/ace8/luci-theme-argon/htdocs/luci-static/argon/img/argon.svg "https://raw.githubusercontent.com/0xACE8/m3d14tek/main/mt7986/ax6k/argone/img/argone.svg"
#rm -rf feeds/ace8/luci-theme-argon/htdocs/luci-static/argon/icon/*.png
#wget --no-check-certificate -O feeds/ace8/luci-theme-argon/htdocs/luci-static/argon/icon/android-icon-192x192.png "https://raw.githubusercontent.com/0xACE8/m3d14tek/main/mt7986/ax6k/argone/icon/android-icon-192x192.png"
#wget --no-check-certificate -O feeds/ace8/luci-theme-argon/htdocs/luci-static/argon/icon/apple-icon-60x60.png "https://raw.githubusercontent.com/0xACE8/m3d14tek/main/mt7986/ax6k/argone/icon/apple-icon-60x60.png"
#wget --no-check-certificate -O feeds/ace8/luci-theme-argon/htdocs/luci-static/argon/icon/apple-icon-72x72.png "https://raw.githubusercontent.com/0xACE8/m3d14tek/main/mt7986/ax6k/argone/icon/apple-icon-72x72.png"
#wget --no-check-certificate -O feeds/ace8/luci-theme-argon/htdocs/luci-static/argon/icon/apple-icon-144x144.png "https://raw.githubusercontent.com/0xACE8/m3d14tek/main/mt7986/ax6k/argone/icon/apple-icon-144x144.png"
#wget --no-check-certificate -O feeds/ace8/luci-theme-argon/htdocs/luci-static/argon/icon/favicon-16x16.png "https://raw.githubusercontent.com/0xACE8/m3d14tek/main/mt7986/ax6k/argone/icon/favicon-16x16.png"
#wget --no-check-certificate -O feeds/ace8/luci-theme-argon/htdocs/luci-static/argon/icon/favicon-32x32.png "https://raw.githubusercontent.com/0xACE8/m3d14tek/main/mt7986/ax6k/argone/icon/favicon-32x32.png"
#wget --no-check-certificate -O feeds/ace8/luci-theme-argon/htdocs/luci-static/argon/icon/favicon-96x96.png "https://raw.githubusercontent.com/0xACE8/m3d14tek/main/mt7986/ax6k/argone/icon/favicon-96x96.png"
#wget --no-check-certificate -O feeds/ace8/luci-theme-argon/htdocs/luci-static/argon/icon/ms-icon-144x144.png "https://raw.githubusercontent.com/0xACE8/m3d14tek/main/mt7986/ax6k/argone/icon/ms-icon-144x144.png"

# upgrade config
#rm -rf package/emortal/default-settings/files/99-default-settings-chinese.sh
#wget --no-check-certificate https://raw.githubusercontent.com/0xACE8/hyp3r-v_x64/main/1mm0rt4lwrt/99-default-settings-chinese.sh -O package/emortal/default-settings/files/99-default-settings-chinese.sh
#wget --no-check-certificate https://raw.githubusercontent.com/0xACE8/hyp3r-v_x64/main/1mm0rt4lwrt/99-init-settings -O package/base-files/files/etc/uci-defaults/99-init-settings
#wget --no-check-certificate https://raw.githubusercontent.com/0xACE8/m3d14tek/main/mt7986/ax6k/zzz-updata-settings -O package/base-files/files/etc/uci-defaults/zzz-updata-settings
wget --no-check-certificate https://raw.githubusercontent.com/0xACE8/r45pb3rry_p1/main/3_m0d3l_b/30-sysinfo.sh -O feeds/packages/utils/bash/files/etc/profile.d/30-sysinfo.sh

echo "diy-part2.sh is done."
