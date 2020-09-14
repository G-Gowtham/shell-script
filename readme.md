# Shell-Script Files:

### lamp.sh :

* Script to install,uninstall,start and stop LAMP services in Debian and RedHat distros.

#### Usage 1 :

* You can run "./lamp.sh lamp (flags)" to run

* Flags [ -i : to install LAMP,  -r : to start services,  -s : to stop services,  -u : to uninstall services ]

#### Usage 2 :

* You can give simply run "./lamp.sh lamp" and choose one of the option from cli menu.

#### Usage 3:

* You can also directly call the functions "./lamp.sh install", "./lamp.sh uninstall", "./lamp.sh start", "./lamp.sh stop", 

#### Usage 4 :
* It also consist of mysql backup to /opt directory and web content updation features.

* "./lamp.sh db_backup" to manually backup the mysql entire DB.

* "./lamp.sh web_content" to update web-content (this feature is limited! you can change the code for your usage)