total_number_folder=`sudo find $1 -type d | wc -l`
top_5_folders=`sudo du -h $1 | sort -rh | head -5 | cat -n | awk '{print $1 " - " $3 ", " $2}'`
total_number_files=`sudo find $1 -type f -exec ls -l {} \; | wc -l`
configuration_files=`sudo find $1 -type f -exec ls -l {} \; | grep ".conf$" | wc -l`
text_files=`sudo find $1 -type f -exec ls -l {} \; | grep ".txt$" | wc -l`
executable_files=`sudo find $1 -type f -perm /a=x | wc -l`
log_files=`sudo find $1 -type f -exec ls -l {} \; | grep ".log$" | wc -l`
archive_files=`sudo find $1 -type f -name "*.zip" -o -name "*.7z" -o -name "*.rar" -o -name "*.tar" | wc -l`
symbolic_links=`ls -la $1 | grep "^l" | wc -l`
top_10_files=`sudo find $1 -type f -exec du -h {} \; | sort -rh | head -10 | cat -n | awk '{print $1 " - " $3 ", " $2}'`
top_10_exe=`sudo find $1 -type f -perm /a=x -exec du -h {} \; | sort -rh | head -10 | cat -n | awk '{print $1 " - " $3 ", " $2}'`

top_10_count=`sudo find $1 -type f -perm /a=x -exec du -h {} \; | sort -rh | head -10 | cat -n | awk '{print $1}'`
top_10_name=`sudo find $1 -type f -perm /a=x -exec du -h {} \; | sort -rh | head -10 | cat -n | awk '{print $3}'`
top_10_mem=`sudo find $1 -type f -perm /a=x -exec du -h {} \; | sort -rh | head -10 | cat -n | awk '{print $2}'`
top_10_sum=`sudo find $1 -type f -exec md5sum {} \; | sort -rh | head -10 | awk '{print $1}'`

array_top_10_count=($top_10_count)
array_top_10_name=($top_10_name)
array_top_10_mem=($top_10_mem)
array_top_10_sum=($top_10_sum)

echo "Total number of folders (including all nested ones) = $total_number_folder"
echo "TOP 5 folders of maximum size arranged in descending order (path and size):" 
echo "$top_5_folders"
echo "Total number of files = $total_number_files"
echo "Number of:"
echo "Configuration files (with the .conf extension) = $configuration_files"
echo "Text files = $text_files"  
echo "Executable files = $executable_files"
echo "Log files (with the extension .log) = $log_files"
echo "Archive files = $archive_files"  
echo "Symbolic links = $symbolic_links"  
echo "TOP 10 files of maximum size arranged in descending order (path, size and type):"
echo "$top_10_files"
echo "TOP 10 executable files of the maximum size arranged in descending order (path, size and MD5 hash of file):"
for (( i = 0; i < 10; i++ ))
do  
    if [[ -z "${array_top_10_count[i]}" ]]
    then
            break
    fi
    printf "${array_top_10_count[$i]} - "
    printf "${array_top_10_name[$i]}, "
    printf "${array_top_10_mem[$i]}, "
    printf "${array_top_10_sum[$i]}\n"
done
end=$(date +%s%N)
sec=$(($end - $start))
secw=`echo "scale=3; $sec / 1000000000"| bc`
echo "Script execution time (in seconds) = $secw s."