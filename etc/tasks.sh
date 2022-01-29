clear
date +'%M : %S' | figlet
echo ""
lua duo.lua -t . > $$.txt; x=$?
cat $$.txt | gawk '
{
 sub(/^PASS/,"\033[1;32mPASS \033[0m")
 sub(/^FAIL/,"\033[1;31mFAIL \033[0m")
 print
}'
rm $$.txt
   
printf  "\n==> \033[33m$x \033[0m\n"  
