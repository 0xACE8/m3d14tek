#!/bin/bash
#=================================================
# Description: DIY script
# Lisence: MIT
# Author: 0xACE7
#=================================================
# Modify default IP
sed -i 's/192.168.1.1/192.168.6.1/g' package/base-files/files/bin/config_generate
sed -i "s/ip6assign='60'/ip6assign='64'/g" package/base-files/files/bin/config_generate
sed -i "s/globals.ula_prefix='auto'/globals.packet_steering='1'/g" package/base-files/files/bin/config_generate

#　编译的固件文件名
# sed -i 's/IMG_PREFIX:=$(VERSION_DIST_SANITIZED)/IMG_PREFIX:=padavan_2305-$(VERSION_DIST_SANITIZED)/g' include/image.mk


# Modify Hostname
sed -i 's/LEDE/Redmi_AX6000/g' package/base-files/files/bin/config_generate

# Change language=auto to zh_cn
#sed -i 's/lang="auto"/lang="zh_cn"/g' package/emortal/default-settings/files/99-default-settings

# Change ash to bash
sed -i 's/ash/bash/g' package/base-files/files/etc/passwd
sed -i 's/$1$V4UetPzk$CYXluq4wUazHjmCDBCqXF./:/g' package/lean/default-settings/files/zzz-default-settings

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

# change navbar 'VPN' to 'NAT'
sed -i 's/msgstr "VPN"/msgstr "NAT"/g' feeds/luci/modules/luci-base/po/zh_Hans/base.po
sed -i 's/20/0/g' package/network/services/uhttpd/files/uhttpd.config
sed -i 's/3600/0/g' feeds/luci/modules/luci-base/root/etc/config/luci

# nas
#sed -i 's/services/nas/g' feeds/luci/applications/luci-app-ksmbd/root/usr/share/luci/menu.d/luci-app-ksmbd.json
#sed -i 's/rcd -vv/\\tprocd_append_param command "--rc-web-gui"/g' feeds/packages/net/rclone/files/rclone.init


# change upnp
#sed -i 's/services/network/g' feeds/luci/applications/luci-app-upnp/root/usr/share/luci/menu.d/luci-app-upnp.json
#sed -i '4 i\\t\t"order": 40,' feeds/luci/applications/luci-app-upnp/root/usr/share/luci/menu.d/luci-app-upnp.json
#sed -i 's/UPnP IGD 和 PCP"/UPnP\/NAT"/g' feeds/luci/applications/luci-app-upnp/po/zh_Hans/upnp.po

# Change to my banner
sed -i 's/\[ \-f \/etc\/banner \] \&\& cat \/etc\/banner/\[ \-f \/etc\/banner \] \&\& cat \/etc\/banner \| lolcat \-h 0.30 \-r \-b/g' package/base-files/files/etc/profile
sudo rm package/base-files/files/etc/banner
wget --no-check-certificate -O package/base-files/files/etc/banner "https://raw.githubusercontent.com/0xACE8/0p3nwrt-general/main/r3dm1_ax6000/banner"

# argon
#sed -i 's/#5e72e4/#ff6900/g' feeds/ace8/luci-theme-argon/htdocs/luci-static/argon/css/cascade.css
#sed -i 's/#5e72e4/#ff6900/g' feeds/ace8/luci-theme-argon/htdocs/luci-static/argon/css/dark.css
#sed -i 's/#483d8b/#ff6900/g' feeds/ace8/luci-theme-argon/htdocs/luci-static/argon/css/cascade.css
#sed -i 's/#483d8b/#ff6900/g' feeds/ace8/luci-theme-argon/htdocs/luci-static/argon/css/dark.css

# Argon upgraded to Xiaomi theme
#sed -i 's/bootstrap/argon/g' feeds/luci/collections/luci/Makefile
#rm -rf feeds/ace8/luci-theme-argon/htdocs/luci-static/argon/img/bg1.jpg
#wget --no-check-certificate -O feeds/ace8/luci-theme-argon/htdocs/luci-static/argon/img/bg1.jpg "https://raw.githubusercontent.com/0xACE8/0p3nwrt-general/main/r3dm1_ax6000/argon/img/bg1.jpg"
#rm -rf feeds/ace8/luci-app-argon/htdocs/luci-static/argon/favicon.ico
#wget --no-check-certificate -O feeds/ace8/luci-theme-argon/htdocs/luci-static/argon/favicon.ico "https://raw.githubusercontent.com/0xACE8/0p3nwrt-general/main/r3dm1_ax6000/argon/favicon.ico"
#rm -rf feeds/ace8/luci-theme-argon/htdocs/luci-static/argon/img/argon.svg
#wget --no-check-certificate -O feeds/ace8/luci-theme-argon/htdocs/luci-static/argon/img/argon.svg "https://raw.githubusercontent.com/0xACE8/0p3nwrt-general/main/r3dm1_ax6000/argon/img/argon.svg"
#rm -rf feeds/ace8/luci-theme-argon/htdocs/luci-static/argon/icon/*.png
#wget --no-check-certificate -O feeds/ace8/luci-theme-argon/htdocs/luci-static/argon/icon/android-icon-192x192.png "https://raw.githubusercontent.com/0xACE8/0p3nwrt-general/main/r3dm1_ax6000/argon/icon/android-icon-192x192.png"
#wget --no-check-certificate -O feeds/ace8/luci-theme-argon/htdocs/luci-static/argon/icon/android-icon-144x144.png "https://raw.githubusercontent.com/0xACE8/0p3nwrt-general/main/r3dm1_ax6000/argon/icon/android-icon-144x144.png"
#wget --no-check-certificate -O feeds/ace8/luci-theme-argon/htdocs/luci-static/argon/icon/apple-icon-60x60.png "https://raw.githubusercontent.com/0xACE8/0p3nwrt-general/main/r3dm1_ax6000/argon/icon/apple-icon-60x60.png"
#wget --no-check-certificate -O feeds/ace8/luci-theme-argon/htdocs/luci-static/argon/icon/apple-icon-72x72.png "https://raw.githubusercontent.com/0xACE8/0p3nwrt-general/main/r3dm1_ax6000/argon/icon/apple-icon-72x72.png"
#wget --no-check-certificate -O feeds/ace8/luci-theme-argon/htdocs/luci-static/argon/icon/apple-icon-144x144.png "https://raw.githubusercontent.com/0xACE8/0p3nwrt-general/main/r3dm1_ax6000/argon/icon/apple-icon-144x144.png"
#wget --no-check-certificate -O feeds/ace8/luci-theme-argon/htdocs/luci-static/argon/icon/favicon-16x16.png "https://raw.githubusercontent.com/0xACE8/0p3nwrt-general/main/r3dm1_ax6000/argon/icon/favicon-16x16.png"
#wget --no-check-certificate -O feeds/ace8/luci-theme-argon/htdocs/luci-static/argon/icon/favicon-32x32.png "https://raw.githubusercontent.com/0xACE8/0p3nwrt-general/main/r3dm1_ax6000/argon/icon/favicon-32x32.png"
#wget --no-check-certificate -O feeds/ace8/luci-theme-argon/htdocs/luci-static/argon/icon/favicon-96x96.png "https://raw.githubusercontent.com/0xACE8/0p3nwrt-general/main/r3dm1_ax6000/argon/icon/favicon-96x96.png"
#wget --no-check-certificate -O feeds/ace8/luci-theme-argon/htdocs/luci-static/argon/icon/ms-icon-144x144.png "https://raw.githubusercontent.com/0xACE8/0p3nwrt-general/main/r3dm1_ax6000/argon/icon/ms-icon-144x144.png"

# upgrade config
#wget --no-check-certificate -O package/base-files/files/etc/uci-defaults/zzz-updata-settings "https://raw.githubusercontent.com/0xACE8/m3d14tek/main/mt7986/ax6k/1mm0rt4lwrt/zzz-updata-settings"
wget --no-check-certificate -O feeds/packages/utils/bash/files/etc/profile.d/30-sysinfo.sh "https://raw.githubusercontent.com/0xACE8/0p3nwrt-general/refs/heads/main/30-sysinfo.sh"
wget --no-check-certificate -O feeds/packages/utils/bash/files/etc/profile.d/50-cloud.sh "https://raw.githubusercontent.com/0xACE8/0p3nwrt-general/main/50-cloud.sh"

echo "diy-part2.sh is done."
