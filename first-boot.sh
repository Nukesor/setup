# Mysql post setup
mysql_secure_installation
mysql -u root -p -e \
'CREATE USER 'nuke'@'localhost' IDENTIFIED BY '';
GRANT ALL PRIVILEGES ON mydb.* TO 'nuke'@'localhost';
FLUSH PRIVILEGES;
quit'

sudo -u postgres -- createuser --interactive
