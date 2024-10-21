#---------Ace Sourse-----
sed -i '1 i\src-git ace8 https://github.com/0xACE8/4c38-p4ck463;laoliu' feeds.conf.default
sed -i '2 i\src-git passwall_packages https://github.com/xiaorouji/openwrt-passwall-packages.git;main' feeds.conf.default\
sed -i '1 i\src-git v5 https://github.com/sbwml/openwrt_helloworld;v5' feeds.conf.default

# patch
#rm -rd target/linux/mediatek/files-5.4/arch/arm64/boot/dts/mediatek/mt7981-cmcc-rax3000m.dtsi
#wget --no-check-certificate -O target/linux/mediatek/files-5.4/arch/arm64/boot/dts/mediatek/mt7981-cmcc-rax3000m.dtsi "https://raw.githubusercontent.com/0xACE8/m3d14tek/main/mt7981/rax3kz/laoliu/mt7981-cmcc-rax3000m.dtsi"
