# xentral-docker-compose
## ERP Xentral
Xentral is a php based erp system (also known as wawision)

* mysql-service:3306 (mysql 5.7.x)
* xentral-service:4000 (xentral 19.2 special thanks to [lobaro/xentral-docker](https://github.com/lobaro/xentral-docker))
* adminer:4001 (mysql admin tool latest)

### Start Xentral & MySQL and Adminer Service
cd into the directory where your docker-compose.yml is located and:

    docker-compose up

### Integrate SQL Backup
Each sql file in the sqldump folder will be imported automatically into the mysql after it is started.

To create a new backup you can use:
    
    docker exec erp_mysql-service_1 sh -c 'exec mysqldump --databases xentral -uroot -p"$MYSQL_ROOT_PASSWORD"' > /some/path/to/your/local/sqldump/folder/xentral-backup.sql

After restarting docker-compose (down/up) this sqldump will automatically be imported.

To manually import a sqldump use:
    
    docker exec -i erp_mysql-service_1 sh -c 'exec mysql -uroot -p"$MYSQL_ROOT_PASSWORD"' < /some/path/to/your/local/sqldump/folder/xentral-backup.sql
