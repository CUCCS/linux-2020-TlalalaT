#!/usr/bin/evn bash

#Web服务器访问日志

TEMP=`getopt -o hiuces: --long sourcehost,sourceip,frenquencyurl,responcecode,errorcode,specifiedurl:,help -n 'exp0x04_2.2.sh' -- "$@"`

URL="/ksc.html"
eval set -- "$TEMP"
funSourceHost()
{
    more +2 web_log.tsv | awk -F'\t' '{print $1}'|sort|uniq -c|sort -nr|head -n 100
    exit 0
}

funSourceHostIP()
{
    more +2 web_log.tsv | awk -F'\t' '{print $1}'|egrep '[[:digit:]]{1,3}\.[[:digit:]]{1,3}\.[[:digit:]]{1,3}\.[[:digit:]]{1,3}'|sort|uniq -c|sort -nr|head -n 100
    exit 0
}

funFrequencyUrl()
{
    more +2 web_log.tsv | awk -F'\t' '{print $5}'|sort | uniq -c |sort -nr | head -n 100
    exit 0
}


funResponceCode()
{
    argu_4_code=$(more +2 web_log.tsv | awk -F'\t' '{print $6}' | sort | uniq -c | sort -nr | head -n 10 | awk '{print $2}')
    argu_4_times=$(more +2 web_log.tsv | awk -F'\t' '{print $6}' | sort | uniq -c | sort -nr | head -n 10 | awk '{print $1}')
    codeArray=($argu_4_code)
    timesArray=($argu_4_times)
    for i in $argu_4_times ; do
        total=$(($total+$i))
    done
    echo -e "Responce code:\n"
    i=0
    while [ $i -lt ${#codeArray[@]} ]; do
        por=$(echo "scale=2; 100 * ${timesArray[${i}]} / $total" | bc)
        echo -e "code:"${codeArray[${i}]}"   times: "${timesArray[${i}]}"    proportion "$por"%"
        i=$(($i+1))
    done
    exit 0
}

funResponceCodeErr()
{
#  errorCode=$(more +2 web_log.tsv |awk -F\\t '{print $6}' | grep '4[0-9][0-9]' | sort | uniq)
#  for i in $errorCode ; do  
#    $(more +2 web_log.tsv |awk -F\\t 'BEGIN{i=0}{if($6==eCode){url[i]=$5;i+=1}}END{for (a in url) print $6,url[a]}' eCode=$i | sort -nr | uniq)
#  done
    echo -e "404 responce code:"
    more +2 web_log.tsv | awk -F'\t' '{print $6,$5}' | grep '404 ' | sort | uniq -c | sort -nr | head -n 10

    echo -e "403 responce code:"
    more +2 web_log.tsv | awk -F'\t' '{print $6,$5}' | grep '403 ' | sort | uniq -c | sort -nr | head -n 10
    exit 0
}

funSpecifiedUrl()
{
    url=""$URL""
    temp="more +2 web_log.tsv | grep \""'${url}'"\" | awk -F'\t' '{print "'$1'"}' | sort | uniq -c | sort -nr | head -n 100"
    eval -- $temp
    exit 0
}
while true ; do
    case "$1" in
        -a|--sourcehost) funSourceHost ; shift ;;
        -b|--sourceip) funSourceHostIP ; shift ;;
        -c|--frenquencyurl) funFrequencyUrl ; shift ;;
        -d|--responcecode) funResponceCode ; shift ;;
        -e|--errorcode) funResponceCodeErr ; shift ;;
        -f|--specifiedurl) URL=$2 ; funSpecifiedUrl ; shift 2;;
        --help) echo -e "Usage: bash exp0x04_2.2.sh [OPTIONS] [PARAMETER] \n
-a, 统计访问来源主机TOP 100和分别对应出现的总次数\n
-b, 统计访问来源主机TOP 100 IP和分别对应出现的总次数\n
-c, 统计最频繁被访问的URL TOP 100\n
-d, 统计不同响应状态码的出现次数和对应百分比\n
-e, 分别统计不同4XX状态码对应的TOP 10 URL和对应出现的总次数\n
-f, 给定URL输出TOP 100访问来源主机\n
--help 帮助\n"; shift ;;
        --) shift ; break ;;
        *) echo "Internal error!" ; exit 1 ;;
    esac
done
