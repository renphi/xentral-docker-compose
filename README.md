# xentral-docker-compose

This is a docker-compose yml file for [xentral](https://xentral.com/) server with [MySQL](https://www.mysql.com/) and [adminer](https://www.adminer.org/):
* mysql-service:3306 (mysql 5.7.x)
* xentral-service:4000 (xentral 19.2 special thanks to [lobaro/xentral-docker](https://github.com/lobaro/xentral-docker))
* adminer:4001 (mysql admin tool latest)

## Prerequisite
* Install docker 
* Install docker-compose

## Start

    docker-compose up

## Stop
If you shutdown your docker containers all data stored in the mysql database will be no longer stored.
Therefore read "Integrate SQL Backup"

    docker-compose down


## At First Start
You have to configure the [general setup](https://xentral.com/helpdesk/grundinstallation) if you start this the first time.
Afterwards you can login and reset your password. A initial sql backup is a good idea.


## Integrate SQL Backup
Each sql file in the sqldump folder will be imported automatically into the mysql after it is started.

To create a new backup you can use:
    
    docker exec erp_mysql-service_1 sh -c 'exec mysqldump --databases xentral -uroot -p"$MYSQL_ROOT_PASSWORD"' > ./sqldump/xentral-backup.sql

After restarting docker-compose (down/up) this sqldump will automatically be imported.

To manually import a sqldump you can use:
    
    docker exec -i erp_mysql-service_1 sh -c 'exec mysql -uroot -p"$MYSQL_ROOT_PASSWORD"' < ./sqldump/xentral-backup.sql
