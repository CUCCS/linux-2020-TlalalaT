#!/usr/bin/env bash


#对指定文件夹下图片进行批处理

#help

if [[ $1 == "--help" || $1 == "-h" ]];then
	echo "脚本为对指定文件夹下图片进行批处理"
	echo "-a file_folder 对jpeg格式图片进行图片质量压缩"
	echo "-b file_folder 对jpeg/png/svg格式图片在保持原始宽高比的前提下压缩分辨率"
	echo "-c file_folder 对图片批量添加水印"
	echo "-d file_folder 批量重命名"
	echo "-e file_folder png/svg图片统一转换为jpg格式图片"
else

	while getopts ":a:b:c:d:e:" image
	do
		case $image in
			#对jpeg格式图片进行图片质量压缩
			a)
				cd "$OPTARG" || exit 1
				for file in *.jpg;do
	        			if [[ $file =~ $0 ]];then
	               				 continue
				        fi
				        printf "==================== %s ====================\n" "$file"
						convert -quality 75 $file "lq"$file
				done
				;;
			#对jpeg/png/svg格式图片在保持原始宽高比的前提下压缩分辨率
			b)
				cd "$OPTARG" || exit 1
				for file in *.jpg;do
	        			if [[ $file =~ $0 ]];then
	               				 continue
				        fi
				        printf "==================== %s ====================\n" "$file"
					convert -resize 50%x50% $file "s"$file
				done
				for file in *.png;do
	        			if [[ $file =~ $0 ]];then
	               				 continue
				        fi
				        printf "==================== %s ====================\n" "$file"
					convert -resize 50%x50% $file "s"$file
				done
				for file in *.svg;do
	       	 			if [[ $file =~ $0 ]];then
	               				 continue
				        fi
				        printf "==================== %s ====================\n" "$file"
				convert -resize 50%x50% $file "s"$file
			done
                        ;;
			#对图片批量添加自定义文本水印
			c)
				cd "$OPTARG" || exit 1
				for file in *;do
	        			if [[ $file =~ $0 ]];then
	               				 continue
				        fi
				        printf "==================== %s ====================\n" "$file"
					convert -fill white -pointsize 36 -draw 'text 10,50 "zlz 2020"' $file $file
				done
	                        ;;
			#批量重命名
			d)
				cd "$OPTARG" || exit 1
				for file in *;do
	        			if [[ $file =~ $0 ]];then
	               				 continue
				        fi
				        printf "==================== %s ====================\n" "$file"
					mv $file "zlz-201811143007-"$file
				done
	                        ;;
			#png/svg图片统一转换为jpg格式图片
			e)
				cd "$OPTARG" || exit 1
				for file in *.png;do
	        			if [[ $file =~ $0 ]];then
	               				 continue
				        fi
				        printf "==================== %s ====================\n" "$file"
					convert $file `basename $file .png`.jpg
				done
				for file in *.svg;do
	        			if [[ $file =~ $0 ]];then
	               				 continue
				        fi
				        printf "==================== %s ====================\n" "$file"
					convert $file `basename $file .svg`.jpg
				done
				#mogrify -format jpg *.png
				#mogrify -format jpg *.svg
	                        ;;
			#参数错误
			?)
				echo "未知参数，请使用--help或-h查看帮助"
				exit 1
	                        ;;
		esac
	done
fi
