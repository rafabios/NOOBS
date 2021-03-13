#!/bin/bash

# VEMCOMPY
# TUTORIAL DE COMO INSTALAR / INSERIR DADOS / IMPORTAR E EXPORTAR UM BANCO DE DADOS MYSQL SERVER / MARIADB
# SQL SAMPLE REFERENCE: https://www.mysqltutorial.org/mysql-sample-database.aspx/

# Pacotes de instalacao

apt-get update
apt-get install -y unzip mariadb-server mariadb-client


wget https://sp.mysqltutorial.org/wp-content/uploads/2018/03/mysqlsampledatabase.zip

unzip wget mysqlsampledatabase.zip




# Comandos do sql

# exemplo
mysql -u user --password senha -h endereco_do_banco


# acessar como admin localmente
mysql -u root

source mysqlsampledatabase.sql

# mostrar databases
show databases;

# utilizar o database
use classicmodels;

# visualizar as tabelas
show tables;

# checando as tabelas
select * from offices;
select * from products;

# adicionado linhas
INSERT INTO offices(officeCode , city , phone , addressLine1 ,addressLine2 , state , country   , postalCode, territory)
VALUES(8 , 'Sao Paulo' , '+55 127 000 0001' ,'100 Fools Street' , 'Suite 14'    , 'SP'         , 'BR'       , '0000'  , 'NA');


# dump do banco (bkp)
export BKPTIME=$(date +%d-%m-%Y_%H%M)
echo $BKPTIME
mysqldump -u root classicmodels > dump_database_$BKPTIME.sql
