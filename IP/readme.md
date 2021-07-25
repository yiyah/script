# Some scripts about IP

1. find_host.bat

    * 作用：用于在局域网下查找存活的主机
    * 平台：Win10, Win7
    * 不足：
      * 只支持子网掩码 `255.255.255.0` 的网段。
      * 时间久，测试发现若只有4个主机，扫描完需要 2 minutes.
    * 使用

        ![看不到图片是科学问题](https://raw.githubusercontent.com/yiyah/Picture_Material/master/20210719205908.png)

2. showMyAdapter.bat

    * 作用：显示配置了IP的适配器及其IP
    * 平台：Win10, Win7
    * 不足：
    * 使用：

        ![看不到图片是科学问题](https://raw.githubusercontent.com/yiyah/Picture_Material/master/20210725112142.png)

3. changeWordColor
    * 作用：给某句话设置颜色
    * 平台：Win10, XP
    * 不足：利用创建文件，然后 findstr 来设置颜色，所以可以设颜色通过 `color /?` 查看
    * 使用：

      ![看不到图片是科学问题](https://raw.githubusercontent.com/yiyah/Picture_Material/master/20210726011737.png)
