reset
LightGreen='\033[1;32m'
RED='\033[1;31m'
NC='\033[0m' # No Color
LightBlue='\033[1;34m'
LightGreen='\033[1;32m'  
yellow='\033[1;33m'
printf "
|------------------------------------------------------------------------------|
|                           APA  Shell Finder                                  |
|------------------------------------------------------------------------------|
|                                                                              |
|                                                                              |
|                                                                              |
|                                                                              |
|                     My website: xHacked.com                                     |
|                     Linux version : $(uname -r)                        | 
|                     Today is $(date)                 |
|------------------------------------------------------------------------------|\n"
printf "Enter URL to scan [eg, http://xHacked.com or https://xHacked.com] \n "
printf "Ex: http://xHacked.com or http://xHacked.com/path \n =>";
read site

pattern="cmd.exe CMD oScript oS szCMD exe doctitle cp exec system ofread explode oFS loginlevel "

printf "${RED}Scaning...\n"

for x in $(cat dict)
do
    urls=$site"/"$x
    printf "${NC}$urls\n"
    res=$(curl -Is $urls | head -1 | gawk -F " " '{print $2}')
    ok="200"
    if [ $res -eq "200" ]
    then
        curl $urls > webpage.txt
        for y in $pattern
        do
            find="$(egrep -w $y webpage.txt)"
            if [ "$find" != '' ]
            then
                printf "${NC}$urls ========> ${LightGreen} Shell ! Found ◉ \n"
            fi
        done
    fi
done
