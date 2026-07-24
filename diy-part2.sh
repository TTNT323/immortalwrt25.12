#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

# Modify default IP
sed -i 's/192.168.1.1/192.168.6.1/g' package/base-files/files/bin/config_generate

# Modify default theme
#sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# Modify hostname
#sed -i 's/OpenWrt/P3TERX-Router/g' package/base-files/files/bin/config_generate

# 修改无线日志级别为0
sed -i '/wireless_add_vif "$name" "$ifname"/a iwpriv "$ifname" set Debug=0' ./package/mtk/applications/mtwifi-cfg/files/netifd/mtwifi.sh

# 删除默认luci-app-ttyd
# sed -i 's/ +luci-app-ttyd//g' ./package/mtk/applications/luci-app-turboacc-mtk/Makefile

# 添加猫咪
# git clone --depth 1 https://github.com/vernesong/OpenClash.git /tmp/openclash-temp
# 查找并复制 luci-app-openclash 目录（无论它在哪个子目录下）
# find /tmp/openclash-temp -type d -name "luci-app-openclash" -exec cp -r {} package/ \;
# 清理临时文件
# rm -rf /tmp/openclash-temp
