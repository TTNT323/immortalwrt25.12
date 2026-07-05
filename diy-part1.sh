#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# 修改无线日志级别为0
sed -i '/wireless_add_vif "$name" "$ifname"/a iwpriv "$ifname" set Debug=0' package/mtk/applications/mtwifi-cfg/files/netifd/mtwifi.sh

# 删除默认luci-app-ttyd
sed -i 's/ +luci-app-ttyd//g' package/mtk/applications/luci-app-turboacc-mtk/Makefile

# 添加猫咪
# 创建插件目录
mkdir -p package/luci-app-openclash
cd package/luci-app-openclash

# 初始化 Git 仓库并拉取 OpenClash 项目
git init
git remote add -f origin https://github.com/vernesong/OpenClash.git

# 启用稀疏检出，只下载 luci-app-openclash 子目录
git config core.sparsecheckout true
echo "luci-app-openclash" >> .git/info/sparse-checkout

# 拉取代码
git pull --depth 1 origin master
git branch --set-upstream-to=origin/master master

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
#echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
#echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default
