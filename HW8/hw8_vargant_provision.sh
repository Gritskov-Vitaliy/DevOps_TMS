#!/bin/bash

user="hw8"
home_dir="/opt/$user"
group="wheel"
hosts="/etc/hosts"
ip_app="127.0.0.1"
app="myownapp.com"
ssh_config="/etc/ssh/sshd_config"
pass_auth_yes="PasswordAuthentication yes"
pass_auth_no="PasswordAuthentication no"
pass_auth=$(sudo sed -i -- "s/$pass_auth_yes/$pass_auth_no/g" $ssh_config)
#pass_auth=$(sudo sed -i -- "s/$pass_auth_no/$pass_auth_yes/g" $ssh_config)
root_login_yes="PermitRootLogin yes"
root_login_no="PermitRootLogin no"
root_login=$(sudo sed -i -- "s/$root_login_yes/$root_login_no/g" $ssh_config)
#root_login=$(sudo sed -i -- "s/$root_login_no/$root_login_yes/g" $ssh_config)
packages="mc vim git"
DNS_file="/etc/resolv.conf"
DNS1="8.8.8.8"
DNS2="1.1.1.1"
directory="/var/log/myownapp"

function add_user {
    sudo useradd -d $home_dir -G $group $user
    echo "Created a $user user with the home directory $home_dir and added to the group $group"
}

function copy_ssh {
    mkdir $home_dir/.ssh
    cp /home/vagrant/.ssh/authorized_keys $home_dir/.ssh/authorized_keys
    echo "Added SSH key for the user $user"
}

function add_app {
    echo "Add adress to $hosts"
    echo "$ip_app $app" | sudo tee -a $hosts
}

function edit_ssh_config {
    $pass_auth
    $root_login
    sudo systemctl reload sshd
    echo "Сhanged the configuration of the ssh connection"
}

function install_packages {
    sudo yum install -y $packages
    echo "Install $packages packages"
}

function update_DNS {
    echo "Update DNS to $DNS1 and $DNS2"
    echo "nameserver $DNS1" | sudo tee -a $DNS_file
    echo "nameserver $DNS2" | sudo tee -a $DNS_file
}

function check_app {

    if ping -c 1 $app | grep "not known"
        then
        add_app
    fi
}

function white_ip {
    wh_ip=$(curl -s eth0.me)
    echo "White IP = $wh_ip"
}

function dir {
    sudo mkdir $directory
    sudo chown -R $user:$user $directory
}

add_user; copy_ssh; add_app; edit_ssh_config; install_packages; update_DNS; check_app; white_ip; dir