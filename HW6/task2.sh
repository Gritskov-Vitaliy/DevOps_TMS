#!/bin/bash

log_file="/var/log/HW6_task2.log"
hosts="/etc/hosts"
app="myapp.com"
Delete_File_Dir="DELETE_ME"
Date=$(date +"%d-%m-%Y %H:%M:%S")

function dir_sort {
    log "Проведена сортировка директорий."
    tput setaf 1
    for find_dir in $(find $HOME -maxdepth 1 -type d -ctime +3)
    do
    Date=`ls $find_dir -al | awk '{if ($9 == ".") {print $6, $7 }}'`
    echo "$find_dir $Date"
    done
tput setaf 7
}

function file_sort {
    log "Проведена сортировка файлов."
    tput setaf 2
    f_sort=find $HOME -maxdepth 1 -type f -ctime +3 | xargs ls -la | awk '{print $9, $6, $7}'
    echo $f_sort
    tput setaf 7
}

function monitor {
    log "Мониторинг системы."
    tput setaf 3
    PIDS="`top -bn1 | grep Tasks | awk '{printf $2}'`"
    echo "PIDS: $PIDS"
    tput setaf 4
    CPU="`uptime | awk '{print $8, $9, $10}'`"
    echo "CPU: $CPU"
	tput setaf 7
    echo '     total free'
    tput setaf 5
    MEM=`free -hm | grep Mem | awk '{print $1, $2, $4}'`
    echo $MEM
	tput setaf 2
    HDD=`df -h | awk '{if ($6 == "/") { print $2, $4 }}' | head -1`
    echo "HDD: $HDD"
    tput setaf 7
}

function add_app {
    tput setaf 6
    if grep -q "$app" $hosts
        then
        echo "Запись уже имеется в $hosts."
        log "Добавление записи в $hosts. Запись $app уже имеется."
        else
        echo "Введите IP адрес для $app"
        tput setaf 7
        read ip
        tput setaf 6
        echo "В $hosts добавлена строка:"
        echo "$ip $app" | sudo tee -a $hosts
        log "Добавление записи в $hosts. IP адрес $ip добавлен для $app."
    fi
}

function edit_app {
    tput setaf 6
    if ! grep -q "$app" $hosts
        then
        log "Редактирование $hosts. Запись отсутствует."
        echo "Запись $app отсутствует в $hosts. Добавить запись? (Yes/No)"
        tput setaf 7
        read choice
        tput setaf 6
        case $choice in
            yes | Yes | YES) add_app;;
            no | No | NO) echo;; 
            *) echo "Ошибка";;
        esac
        else
        echo "Введите новый IP адресс для $hosts"
        tput setaf 7
        read ip
        tput setaf 6
        old_ip=`grep "$app" $hosts`
        new_ip="$ip $app"
        sudo sed -i -- "s/$old_ip/$new_ip/g" $hosts
        echo "Запись изменена на:"
        echo $new_ip
        log "Редактирование $hosts. IP адрес для $app изменен на $ip."
    fi
}

function del_me {
    tput setaf 6
    log "Включен поиск $Delete_File_Dir."
    while [ ! -d $Delete_File_Dir ] && [ ! -f $Delete_File_Dir ]
        do
            echo "Ожидаем файл или директорию $Delete_File_Dir"
            sleep 5
        done
            echo "Обнаружен $Delete_File_Dir. Сделана запись в $log_file:"
            if [[ -d $Delete_File_Dir ]]
                then
                echo "$Date: Обнаружена директория $Delete_File_Dir, в директории создан файл temp, в файл temp внесена информация о времени создания файла" >> $log_file
                date >> $Delete_File_Dir/temp
                else
                echo "$Date: Обнаружен файл $Delete_File_Dir, в файл внесена информация о времени создания" >> $log_file
                date >> $Delete_File_Dir
            fi 
}

function log {
    action=$1
    Pid=$(ps aux | awk '{if ($12 == "./task2.sh"){print $2}}')
    user=$(ps aux | awk '{if ($12 == "./task2.sh"){print $1}}')
    Log="$Date: $action Номер процесса: $Pid, Пользователь: $user"
    echo $Log >> $log_file
}


while :;
do
    tput setaf 6
    echo "--------------------------------------------------------------------"
    echo "Функции:"
    echo "1) Сортировка в алфавитном порядке директорий старше 3-х дней из $HOME"
    echo "2) Сортировка в алфавитном порядке файлов старше 3-х дней из $HOME"
    echo "3) Мониторинг системы"
    echo "4) Добавление $app в $hosts"
    echo "5) Изменение $app в $hosts"
    echo "6) Реагирование на файл или директорию $Delete_File_Dir"
    echo "7) Показать логи"; tput setaf 7
    read option
    case $option in
        1) dir_sort;;
        2) file_sort;;
        3) monitor;;
        4) add_app;;
        5) edit_app;;
        6) del_me;;
        7) cat $log_file;;
    esac
done