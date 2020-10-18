username="BXXXXXXXX"
passwd="XXXXXX"
# 电信：   @njxy
# 移动：   @cmcc
# 校园网： 空字符串即可
operator="@njxy"

# 以下内容非必要无需修改 
eth=`route | grep UG | awk -F ' ' '{print $8}'`
ip=`ifconfig $eth | grep "10\.16[0-9]\.[0-9]\{1,3\}\.[0-9]\{1,3\}" -o | head -1`
if [ -z $ip ];
then   
  echo "get ip failed"
  logger "get ip failed" -t "autologin.sh"
  exit 1
fi
logger "current ip: ${ip}" -t "autologin.sh"
echo "current ip: ${ip}"

curl "http://10.10.244.11:801/eportal/?c=ACSetting&a=Login&protocol=http:&hostname=10.10.244.11&iTermType=1&wlanuserip=${ip}&wlanacip=10.255.252.150&wlanacname=XL-BRAS-SR8806-X&mac=00-00-00-00-00-00&ip=${ip}&enAdvert=0&queryACIP=0&loginMethod=1" --data "DDDDD=,0,${username}${operator}&upass=${passwd}&R1=0&R2=0&R3=0&R6=0&para=00&0MKKey=123456"
function get_json_value()
{
  local json=$1
  local key=$2

  if [[ -z "$3" ]]; then
    local num=1
  else
    local num=$3
  fi

  local value=$(echo "${json}" | awk -F"[,:}]" '{for(i=1;i<=NF;i++){if($i~/'${key}'\042/){print $(i+1)}}}' | tr -d '"' | sed -n ${num}p)

  echo ${value}
}
status=$(get_json_value $(curl -s "http://10.10.244.11:801/eportal/?c=ACSetting&a=checkScanIP&callback=jQuery111309554246788418939_1602679411198&wlanuserip=10.161.142.84&_=1602679411199") result)

if [ $status = "ok" ]; then
  echo "login succeed"
  logger "login succeed" -t "autologin.sh"
else
  echo "login failed"
  logger "login failed" -t "autologin.sh"
fi
