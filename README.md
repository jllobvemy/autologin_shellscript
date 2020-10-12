# autologin_shellscript

南京邮电大学校园网自动登录脚本

## Windows

1. 管理员权限启动Powershell
    运行命令`Set-ExecutionPolicy Remotesigned`

    此命令用于开启PowerShell运行脚本的权利

    Windows出于安全考虑，默认不允许运行PowerShell脚本

2. 编辑文件`autologin.ps1`

    设置自己的校园网账户

    username(校园网账户)

    passwd(密码)

    operator(登录方式)

    如果为电信则登录方式为`@njxy`，移动为`@cmcc`，校园网则修改为空字符串

3. 为`autologin.vbs`创建快捷方式，将快捷方式复制到开机自启的文件夹中

    Windows默认的自启动文件夹为`C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp`

## Linux

1. 编辑文件`autologin.sh`

    设置自己的校园网账户

    username(校园网账户)

    passwd(密码)

    operator(登录方式)

    如果为电信则登录方式为`@njxy`，移动为`@cmcc`，校园网则修改为空字符串

2. 为`autologin.sh`添加执行权限

    ```bash
    chmod +x ./autologin.sh
    ```

3. 将`autologin.sh`添加为系统启动文件
