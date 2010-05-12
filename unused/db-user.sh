#!/usr/bin/env bash
USER=$1
PASSWORD=$2
DB_NAME=$3

mysql mysql -u root -e "drop user '$USER'@'%.concord.org';"
mysql mysql -u root -e "drop user '$USER'@'63.138.119.%';"
mysql mysql -u root -e "drop user '$USER'@'localhost';"
mysql mysql -u root -e "drop user '$USER'@'127.0.0.1';"

mysql mysql -u root -e "create user '$USER'@'63.138.119.%' identified by '$PASSWORD';"
mysql mysql -u root -e "create user '$USER'@'%.concord.org' identified by '$PASSWORD';"
mysql mysql -u root -e "create user '$USER'@'localhost' identified by '$PASSWORD';"
mysql mysql -u root -e "create user '$USER'@'127.0.0.1' identified by '$PASSWORD';"

mysql mysql -u root -e "grant all privileges on ${DB_NAME}_test.* to '$USER'@'%.concord.org' with grant option;"
mysql mysql -u root -e "grant all privileges on ${DB_NAME}_dev.* to '$USER'@'%.concord.org' with grant option;"
mysql mysql -u root -e "grant all privileges on ${DB_NAME}_pro.* to '$USER'@'%.concord.org' with grant option;"

mysql mysql -u root -e "grant all privileges on ${DB_NAME}_test.* to '$USER'@'63.138.119.%' with grant option;"
mysql mysql -u root -e "grant all privileges on ${DB_NAME}_dev.* to '$USER'@'63.138.119.%' with grant option;"
mysql mysql -u root -e "grant all privileges on ${DB_NAME}_pro.* to '$USER'@'63.138.119.%' with grant option;"

mysql mysql -u root -e "grant all privileges on ${DB_NAME}_test.* to '$USER'@'localhost' with grant option;"
mysql mysql -u root -e "grant all privileges on ${DB_NAME}_dev.* to '$USER'@'localhost' with grant option;"
mysql mysql -u root -e "grant all privileges on ${DB_NAME}_pro.* to '$USER'@'localhost' with grant option;"

mysql mysql -u root -e "grant all privileges on ${DB_NAME}_test.* to '$USER'@'127.0.0.1' with grant option;"
mysql mysql -u root -e "grant all privileges on ${DB_NAME}_dev.* to '$USER'@'127.0.0.1' with grant option;"
mysql mysql -u root -e "grant all privileges on ${DB_NAME}_pro.* to '$USER'@'127.0.0.1' with grant option;"