#---------Ace Sourse-----
sed -i '1 i\src-git ace8 https://github.com/0xACE8/4c38-p4ck463;laoliu' feeds.conf.default
sed -i '2 i\src-git passwall_packages https://github.com/xiaorouji/openwrt-passwall-packages.git;main' feeds.conf.default
sed -i '$a src-git hello https://github.com/fw876/helloworld' feeds.conf.default

# patch
wget --no-check-certificate -O target/linux/mediatek/files-5.4/arch/arm64/boot/dts/mediatek/mt7981-cmcc-rax3000m-xr30.dtsi "https://raw.githubusercontent.com/0xACE8/Cmcc-XR30-Core/main/target/linux/mediatek/files-5.4/arch/arm64/boot/dts/mediatek/mt7981-cmcc-rax3000m-xr30.dtsi"
wget --no-check-certificate -O target/linux/mediatek/files-5.4/arch/arm64/boot/dts/mediatek/mt7981-cmcc-xr30-emmc.dts "https://raw.githubusercontent.com/0xACE8/Cmcc-XR30-Core/main/target/linux/mediatek/files-5.4/arch/arm64/boot/dts/mediatek/mt7981-cmcc-xr30-emmc.dts"
wget --no-check-certificate -O target/linux/mediatek/files-5.4/arch/arm64/boot/dts/mediatek/mt7981-cmcc-xr30.dts "https://raw.githubusercontent.com/0xACE8/Cmcc-XR30-Core/main/target/linux/mediatek/files-5.4/arch/arm64/boot/dts/mediatek/mt7981-cmcc-xr30.dts"
wget --no-check-certificate -O target/linux/mediatek/files-5.4/arch/arm64/boot/dts/mediatek/mt7981-cmcc-xr30.dtsi "https://raw.githubusercontent.com/0xACE8/Cmcc-XR30-Core/main/target/linux/mediatek/files-5.4/arch/arm64/boot/dts/mediatek/mt7981-cmcc-xr30.dtsi"
