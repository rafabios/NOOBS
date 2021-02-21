#!/bin/bash


IP=$(ip add | grep -vE "127|inet6" | grep inet | cut -d" " -f6 | cut -d"/" -f1)
DISK_SIZE="3G"

echo "Instalando o nginx!"
apt-get update && \
	apt-get install -y nginx

echo "Configurando a pagina inicial"
echo '''
<html>

<body>

<h1>VEMCOMPY</h1>


</body>
</html>

''' > /var/www/html/index.html


echo ""
echo "Valide o funcionamento:"
echo "http://$IP"

echo ""

echo "Reiniciando o servico do nginx"
systemctl restart nginx

echo ""
echo "Aguarde alguns minutos"
sleep 1m

echo ""
echo "Criando a falha"
fallocate -l $DISK_SIZE /var/log/nginx/access.1
tail -f /var/log/nginx/access.1 > /dev/null  &
echo "bug" >> /etc/nginx/nginx.conf
systemctl restart nginx
clear
echo "SISTEMA BUGADO!"
