$username = 'BXXXXXXXX'
$passwd = 'XXXXXX'
# 电信：   @njxy
# 移动：   @cmcc
# 校园网： 空字符串即可
$operator = '@njxy'

# 以下内容非必要不需要修改
$ip = [net.dns]::GetHostAddresses('') | select -ExpandProperty IPAddressToString | Select-String '10.16'
$uri = 'http://10.10.244.11:801/eportal/?c=ACSetting&a=Login&protocol=http:&hostname=10.10.244.11&iTermType=1&wlanuserip=' + $ip +'&wlanacip=10.255.252.150&wlanacname=XL-BRAS-SR8806-X&mac=00-00-00-00-00-00&ip=' + $ip + '&enAdvert=0&queryACIP=0&loginMethod=1' 
$Data = @{
    'DDDDD' = ',0,' + $username + $operator
    'upass' = $passwd
    'R1' = '0'
    'R2' = '0'
    'R3' = '0'
    'R6' = '0'
    'para' = '00'
    '0MKKey' = '123456'
}

Invoke-WebRequest  $uri -Body $Data -Method 'POST' -UserAgent ([Microsoft.PowerShell.Commands.PSUserAgent]::Chrome)