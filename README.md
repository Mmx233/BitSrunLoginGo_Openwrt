# BitSrunLoginGo_Openwrt
BitSrunLoginGo的openwrt插件

详细用法见 [BitSrunLoginGo](https://github.com/Mmx233/BitSrunLoginGo)

# 下载源码
```shell
cd packages
git clone -b v2.7 https://github.com/Mmx233/BitSrunLoginGo_Openwrt
```

# 选择插件
`make menuconfig` -> Utilities -> BitSrunLoginGo

# 编译
```shell
make packages/BitSrunLoginGo_Openwrt/complie
```

# 使用
`service BitSrunLogin start` 首次运行后，编辑 `/etc/config/BitSrunLoginGo.json`

`service BitSrunLogin enable` 开机启动

`service BitSrunLogin disable` 取消开机启动

在命令行使用

```shell
BitSrunLoginGo #args 见BitSrunLoginGo说明
```
