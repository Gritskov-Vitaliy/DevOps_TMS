#!/bin/bash

servers_list="servers_list"
user_SSH="tms"
variables_file="variables_file"
variable="SENT"

function list {
   i=1
   cat $servers_list | while read ip; do
        tput setaf 2; echo -n "Server $i ip:"; tput setaf 1; echo " $ip"
        let "i+=1"
   done
tput setaf 7
}

function ssh {
   cat $servers_list | while read ip; do
        echo "Подключаемся к серверу $ip"
        ssh $user_SSH@$ip -p 2222 'bash -s' < $variables_file
   done
}

function upper {
    tput setaf 2; cat $variables_file | awk '{print toupper($0)}'; tput setaf 7
}

function lower {
    tput setaf 2; cat $variables_file | awk '{print tolower($0)}'; tput setaf 7
}

function arr {
    cat $variables_file | grep $variable > tempfile
    . ./tempfile
    read -r -a array <<< $SENT
    tput setaf 2; echo "${array[0]}"
    echo "${array[-1]}"; tput setaf 7
}

function help {
    tput setaf 2; echo "Тут должна быть помощь, но она отошла на обед -_-"; tput setaf 7
}

tput setaf 6
echo "Функции:"
echo "1) Вывести список серверов из $servers_list"
echo "2) Подключиться по SSH к серверам и выполнить команды из $variables_file"
echo "3) Вывести содержимое $variables_file в виде 'all uppercase'"
echo "4) Вывести содержимое $variables_file в виде 'all lowercase'"
echo "5) Вывести первый и последний элемент из переменной $variable файла $variables_file"
echo "-h, h, -help, help) Показать помощь"; tput setaf 7
read option
case $option in
    1) list;;
    2) ssh;;
    3) upper;;
    4) lower;;
    5) arr;;
    -h |h | -help | help) help;;

esac
