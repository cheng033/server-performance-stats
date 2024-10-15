cpu_usage=$(top -b -n 1 | grep "Cpu(s)" | awk '{print 100 - $8 "%"}' )
echo "CPU usage : $cpu_usage"

mem_usage=$(free -m | awk 'NR==2{printf "Used: %sMB (%.1f%%), Free: %sMB (%.1f%%)",$3,$3*100/$2,$4,$4*100/$2 }')
echo "MEM usage : $mem_usage"

disk_usage=$(df -h | awk 'NR==5{printf "Used: %sB (%.1f%%), Free: %sB (%.1f%%)\n",$3,$5,$4,$4*100/$2}')
echo "DISK usage: $disk_usage"

top_five_cpu=$(ps aux --sort=-%cpu | awk 'NR<=6{printf "%-5s %-5s %-5s %-5s\n", $1,$2,$3,$11}')
echo -e "Top 5 processes by CPU usage: \n$top_five_cpu"

top_five_mem=$(ps aux --sort=-%mem | awk 'NR<=6{printf "%-5s %-5s %-5s %-5s\n", $1,$2,$4,$11}')
echo -e "Top 5 processes by MEM usage: \n$top_five_mem"
