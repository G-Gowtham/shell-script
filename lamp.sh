#!/bin/bash

# MySQL daily backup
db_backup()
{  
    sudo mysqldump -u root -p --all-databases > /opt/backups/mysql_backup.sql && chmod 777 /opt/backups/mysql_backup.sql;
    echo -e "Daily Backup successfull.....................................\n"; 
}

# Cloning and pushing PHP file form github

web_content()
{
    
    sudo chmod 777 /var/www/html;
    cd /var/www/html;
    sudo rm -r php;
    sudo git clone https://github.com/G-Gowtham/php;
    sudo chmod 755 /var/www/html;
}

# Installing LAMP stack

install()
{
    echo -e "Installing/Checking LAMP stack...............................\n";

    if test -f "/etc/debian_version"; then
        echo -e "\nIt is a Debian distro..................................\n";
        sudo apt install apache2 -y;
        sudo apt install php libapache2-mod-php php-mysql -y;
        sudo apt install mariadb-server -y;
    else
        echo -e "\nIt is a Redhat Distro..................................\n";
        sudo yum install httpd -y;
        sudo yum install mariadb-server -y;
        sudo yum install php php-common php-mcrypt php-cli php-mysql -y;
    fi
}

# Starting LAMP services

start()
{
    
    #install

    echo -e "\nChecked/Installed the LAMP stack...........................\n";

    if test -f "/etc/debian_version"; then
        sudo systemctl start apache2;
        sudo systemctl start mariadb;
    else
        sudo systemctl start httpd.service
        sudo systemctl start mariadb
    fi

    echo -e "Started LAMP services.......................................\n";
}

# Stopping LAMP service

stop()
{

    if test -f "/etc/debian_version"; then
        echo -e "\nIt is a Debian distro........................................\n";
        sudo systemctl stop apache2;
        sudo systemctl stop mariadb;
    else
        echo -e "\nIt is a Redhat Distro........................................\n";
        sudo systemctl stop httpd.service
        sudo systemctl stop mariadb
    fi

    echo -e "\nStopped LAMP services..........................................\n";
}

#UnInstalling LAMP services

uninstall()
{
    if test -f "/etc/debian_version"; then
        echo -e "\nIt is a Debian distro..................................\n";
        sudo apt remove apache2 -y;
        sudo apt remove php libapache2-mod-php php-mysql -y;
        sudo apt remove mariadb-server -y;
    else
        echo -e "\nIt is a Redhat Distro..................................\n";
        sudo yum remove httpd -y;
        sudo yum remove mariadb-server -y;
        sudo yum remove php php-common php-mcrypt php-cli php-mysql -y;
    fi

    echo -e "LAMP stack Uninstalled successfully!..........................\n";
}

# Root function for calling all the function

lamp()
{
    # Env vs CMD variables priority check

    def="5"

    if [ -n "$1" ]; then
        def="$1";
    fi

    echo -e "Press 1 - To Install LAMP\nPress 2 - To Start LAMP\nPress 3 - To Stop LAMP\nPress 4 - To UnInstall\n";
    read -p "Enter your choice : " choice;

    if [ "$choice" != "" ]; then
        def="$choice";
    fi

    #Calling necessary functions according to the choice & 'def' means deafult 

    if [ "$def" == "1" ];
    then
        install;
    elif [ "$def" == "2" ];
    then
        start;
    elif [ "$def" == "3" ];
    then
        stop;
    elif [ "$def" == "4" ];
    then
        uninstall;
    else
        echo -e "\nThe options are not selected";
    fi
}

"$@"
