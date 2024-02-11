# ecommerce_reporting

## Reporting for a typical e-commerce analytics

### For error while saving the output of select as csv

SHOW VARIABLES LIKE "secure_file_priv";

show variables like "local_infile";

set global local_infile = 1;

https://stackoverflow.com/a/75540862/6134928

On Ubuntu 14 and Mysql 5.5.53 this setting seems to be enabled by default. To disable it you need to add secure-file-priv = "" to your my.cnf file under the mysqld config group. eg:-

sudo cat /etc/my.cnf

[mysqld]
secure-file-priv = ""

Restart server from the workbench

Permission denied: '/usr/local/mysql/data/mysqld.local.err'
 - sudo chown -R _mysql:_mysql /usr/local/mysql/data/
 - sudo chmod -R 755 /usr/local/mysql/data/
 - ps aux | grep mysql
 - stop mysql workbench
 - sudo kill -15  <pid>
 - sudo /usr/local/mysql/support-files/mysql.server start
 - restart mysql workbench


copy all csvs to reporting folder

sudo cp /tmp/query_output/* .
 - sudo chown -R shres:staff *


pip install openpyxl pandas
