#!/usr/bin/evn bash

#对附件分别进行批量处理完成相应的数据统计任务

#2014世界杯运动员数据

data_file1='data_test/worldcupplayerinfo.tsv'

declare -a age
declare -a position
declare -a name
i=0

lt20=0 #年龄小于20的人数
ge20_le30=0 #年龄在20-30的人数
gt30=0 #年龄大于30的人数
lt20p=0
ge20_le30p=0
gt30p=0

declare -A posinum
posinum['Goalie']=0 #Goalie人数
posinum['Defender']=0 #Defender人数
posinum['Midfielder']=0 #Midfielder人数
posinum['Forward']=0 #Forward人数
Goaliep=0
Defenderp=0
Midfielderp=0
Forwardp=0

#标记
#mlname=1
#msname=1
#myage=1
#moage=1

#lname=0 #名字最长长度
#sname=0 #名字最短长度
#yage=0 #年龄最小
#oage=0 #年龄最大

IFS=
while read -r line;do
	age[$i]=`echo $line | cut -d $'\t' -f 6`
	position[$i]=`echo $line | cut -d $'\t' -f 5`
	name[$i]=`echo $line | cut -d $'\t' -f 9`
	if [[ $i -ge 1 ]];then
		if [[ ${age[$i]} -lt 20 ]];then
			lt20=$(($lt20+1))
		fi
		if [[ ${age[$i]} -ge 20 && ${age[$i]} -le 30 ]];then
			ge20_le30=$(($ge20_le30+1))
		fi
		if [[ ${age[$i]} -gt 30 ]];then
			gt30=$(($gt30+1))
		fi 
	fi
	if [[ $i -ge 1 ]];then
		if [[ ${position[$i]} == 'Goalie' ]];then
			posinum['Goalie']=$((${posinum['Goalie']}+1))
		fi
		if [[ ${position[$i]} == 'Defender' ]];then
                        posinum['Defender']=$((${posinum['Defender']}+1))
                fi
		if [[ ${position[$i]} == 'Midfielder' ]];then
                        posinum['Midfielder']=$((${posinum['Midfielder']}+1))
                fi
		if [[ ${position[$i]} == 'Forward' ]];then
                        posinum['Forward']=$((${posinum['Forward']}+1))
                fi
	fi
#	if [[ $i -ge 1 ]];then
#		if [[ ${#{name[$i]}} -ge ${#${name[$mlname]}} ]];then
#			mlname=$i
#			lname=${#{name[$i]}}
#		fi
#		if [[ ${#{name[$i]}} -le ${#{name[$msname]}} ]];then
#                        msname=$i
#                fi
#	fi
	i=$i+1
done < ${data_file1}

lt20p=`echo "scale=4; ${lt20}/${#age[@]}" | bc`
ge20_le30p=`echo "scale=4; ${ge20_le30}/${#age[@]}" | bc`
gt30p=`echo "scale=4; ${gt30}/${#age[@]}" | bc`
Goaliep=`echo "scale=4; ${posinum['Goalie']}/${#position[@]}" | bc`
Defenderp=`echo "scale=4; ${posinum['Defender']}/${#position[@]}" | bc`
Midfielderp=`echo "scale=4; ${posinum['Midfielder']}/${#position[@]}" | bc`
Forwardp=`echo "scale=4; ${posinum['Forward']}/${#position[@]}" | bc`

echo "====================2014世界杯运动员数据===================="
echo "20岁以下球员的数量："$lt20
echo "20岁以下球员的百分比："$lt20p
echo "20-30球员的数量："$ge20_le30
echo "20-30球员的百分比："$ge20_le30p
echo "30岁以上球员的数量："$gt30
echo "30岁以上球员的百分比："$gt30p
echo "Goalie球员数量："${posinum['Goalie']}
echo "Goalie球员百分比："$Goaliep
echo "Defender球员数量："${posinum['Defender']}
echo "Defender球员百分比："$Defenderp
echo "Midfielder球员数量："${posinum['Midfielder']}
echo "Midfielder百分比："$Midfielderp
echo "Forward球员数量："${posinum['Forward']}
echo "Forward球员百分比："$Forwardp
#echo "名字最长的球员:"
#for name in ${name[@]};do
#	if [[ ${#name} == $lname ]];then
#		echo $name
#	fi
#done
