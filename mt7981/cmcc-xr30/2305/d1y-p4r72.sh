#!/bin/bash
#=================================================
# Description: DIY script
# Lisence: MIT
# Author: 0xACE7
#=================================================
# Modify default IP
sed -i 's/192.168.1.1/192.168.177.1/g' package/base-files/files/bin/config_generate
sed -i 's/192.168.6.1/192.168.177.1/g' package/base-files/files/bin/config_generate
sed -i "s/ip6assign='60'/ip6assign='64'/g" package/base-files/files/bin/config_generate
sed -i "s/globals.ula_prefix='auto'/globals.packet_steering='1'/g" package/base-files/files/bin/config_generate
sed -i 's/2:-dhcp/2:-pppoe/g' package/base-files/files/lib/functions/uci-defaults.sh
sed -i "s|DISTRIB_REVISION='%R'|DISTRIB_REVISION='%R$(date +%Y.%m.%d)'|g" package/base-files/files/etc/openwrt_release
sed -i 's/%D/AceyWrt/g' package/base-files/files/etc/openwrt_release

# Modify Hostname
sed -i 's/ImmortalWrt/CMCC_XR30/g' package/base-files/files/bin/config_generate

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
#sed -i 's/MultiWAN 管理器"/分流状态"/g' feeds/luci/applications/luci-app-mwan3/po/zh_Hans/mwan3.po
sed -i '412d' feeds/luci/applications/luci-app-mwan3/po/zh_Hans/mwan3.po
sed -i '412 i\msgstr "分流状态"' feeds/luci/applications/luci-app-mwan3/po/zh_Hans/mwan3.po
sed -i '414 i\msgid "MultiWAN Manager2"\nmsgstr "分流管理"\n' feeds/luci/applications/luci-app-mwan3/po/zh_Hans/mwan3.po
sed -i '415G' feeds/luci/applications/luci-app-mwan3/po/zh_Hans/mwan3.po
sed -i '46d' feeds/luci/applications/luci-app-mwan3/root/usr/share/luci/menu.d/luci-app-mwan3.json
sed -i '46 i\\t\t"title": "MultiWAN Manager2",' feeds/luci/applications/luci-app-mwan3/root/usr/share/luci/menu.d/luci-app-mwan3.json

# change navbar 'VPN' to 'NAT'
sed -i 's/msgstr "VPN"/msgstr "NAT"/g' feeds/luci/modules/luci-base/po/zh_Hans/base.po
sed -i 's/20/0/g' package/network/services/uhttpd/files/uhttpd.config
sed -i 's/3600/0/g' feeds/luci/modules/luci-base/root/etc/config/luci

# change upnp
sed -i 's/msgstr "UPnP"/msgstr "UPnP\/NAT"/g' feeds/luci/applications/luci-app-upnp/po/zh_Hans/upnp.po
sed -i 's/services/network/g' package/mtk/applications/luci-app-upnp-mtk-adjust/root/usr/share/luci/menu.d/luci-app-upnp.json
sed -i '4 i\\t\t"order": 40,' package/mtk/applications/luci-app-upnp-mtk-adjust/root/usr/share/luci/menu.d/luci-app-upnp.json

# remove printer support
sed -i '/luci-app-usb-printer/d' target/linux/mediatek/image/mt7981.mk
sed -i 's/luci-app-usbmodem/ /g' target/linux/mediatek/image/mt7981.mk

# Change to my banner
#sudo rm package/emortal/default-settings/files/openwrt_banner
#wget https://raw.githubusercontent.com/0xACE8/m3d14tek/main/mt7986/ax6k/banner -O package/emortal/default-settings/files/openwrt_banner
sed -i 's/\[ \-f \/etc\/banner \] \&\& cat \/etc\/banner/\[ \-f \/etc\/banner \] \&\& cat \/etc\/banner \| lolcat \-h 0.30 \-r \-b/g' package/base-files/files/etc/profile
sudo rm package/base-files/files/etc/banner
wget --no-check-certificate -O package/base-files/files/etc/banner "https://raw.githubusercontent.com/0xACE8/0p3nwrt-general/main/cmcc-xr30/banner"

# delete immortalwrt kcptun
rm -rf feeds/packages/net/kcptun
rm -rf feeds/luci/applications/luci-app-kcptun
rm -rf feeds/ace8/luci-app-turboacc

# Argon upgraded to Xiaomi theme
rm -rf feeds/ace8/luci-theme-argon/htdocs/luci-static/argon/img/bg1.jpg
wget --no-check-certificate -O feeds/ace8/luci-theme-argon/htdocs/luci-static/argon/img/bg1.jpg "https://raw.githubusercontent.com/0xACE8/0p3nwrt-general/main/cmcc_rax3000z_pro/argon/img/bg1.jpg"
rm -rf feeds/ace8/luci-app-argon/htdocs/luci-static/argon/favicon.ico
wget --no-check-certificate -O feeds/ace8/luci-theme-argon/htdocs/luci-static/argon/favicon.ico "https://raw.githubusercontent.com/0xACE8/0p3nwrt-general/main/cmcc_rax3000z_pro/argon/favicon.ico"
rm -rf feeds/ace8/luci-theme-argon/htdocs/luci-static/argon/img/argon.svg
wget --no-check-certificate -O feeds/ace8/luci-theme-argon/htdocs/luci-static/argon/img/argon.svg "https://raw.githubusercontent.com/0xACE8/0p3nwrt-general/main/cmcc_rax3000z_pro/argon/img/argon.svg"
rm -rf feeds/ace8/luci-theme-argon/htdocs/luci-static/argon/icon/*.png
wget --no-check-certificate -O feeds/ace8/luci-theme-argon/htdocs/luci-static/argon/icon/android-icon-192x192.png "https://raw.githubusercontent.com/0xACE8/0p3nwrt-general/main/cmcc_rax3000z_pro/argon/icon/android-icon-192x192.png"
wget --no-check-certificate -O feeds/ace8/luci-theme-argon/htdocs/luci-static/argon/icon/android-icon-144x144.png "https://raw.githubusercontent.com/0xACE8/0p3nwrt-general/main/cmcc_rax3000z_pro/argon/icon/android-icon-144x144.png"
wget --no-check-certificate -O feeds/ace8/luci-theme-argon/htdocs/luci-static/argon/icon/apple-icon-60x60.png "https://raw.githubusercontent.com/0xACE8/0p3nwrt-general/main/cmcc_rax3000z_pro/argon/icon/apple-icon-60x60.png"
wget --no-check-certificate -O feeds/ace8/luci-theme-argon/htdocs/luci-static/argon/icon/apple-icon-72x72.png "https://raw.githubusercontent.com/0xACE8/0p3nwrt-general/main/cmcc_rax3000z_pro/argon/icon/apple-icon-72x72.png"
wget --no-check-certificate -O feeds/ace8/luci-theme-argon/htdocs/luci-static/argon/icon/apple-icon-144x144.png "https://raw.githubusercontent.com/0xACE8/0p3nwrt-general/main/cmcc_rax3000z_pro/argon/icon/apple-icon-144x144.png"
wget --no-check-certificate -O feeds/ace8/luci-theme-argon/htdocs/luci-static/argon/icon/favicon-16x16.png "https://raw.githubusercontent.com/0xACE8/0p3nwrt-general/main/cmcc_rax3000z_pro/argon/icon/favicon-16x16.png"
wget --no-check-certificate -O feeds/ace8/luci-theme-argon/htdocs/luci-static/argon/icon/favicon-32x32.png "https://raw.githubusercontent.com/0xACE8/0p3nwrt-general/main/cmcc_rax3000z_pro/argon/icon/favicon-32x32.png"
wget --no-check-certificate -O feeds/ace8/luci-theme-argon/htdocs/luci-static/argon/icon/favicon-96x96.png "https://raw.githubusercontent.com/0xACE8/0p3nwrt-general/main/cmcc_rax3000z_pro/argon/icon/favicon-96x96.png"
wget --no-check-certificate -O feeds/ace8/luci-theme-argon/htdocs/luci-static/argon/icon/ms-icon-144x144.png "https://raw.githubusercontent.com/0xACE8/0p3nwrt-general/main/cmcc_rax3000z_pro/argon/icon/ms-icon-144x144.png"

# upgrade config
wget --no-check-certificate -O package/base-files/files/etc/uci-defaults/zzz-updata-settings "https://raw.githubusercontent.com/0xACE8/m3d14tek/main/mt7981/cmcc-xr30/zzz-updata-settings"
wget --no-check-certificate -O feeds/packages/utils/bash/files/etc/profile.d/30-sysinfo.sh "https://raw.githubusercontent.com/0xACE8/0p3nwrt-general/main/30-sysinfo.sh"

echo "diy-part2.sh is done."
