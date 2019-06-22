# Download e instalação

export PHP_DIR=php-7.3.6

tar jxvf php-7.3.6.tar.bz2
./configure --enable-fpm --with-mysqli
cd $PHP_DIR
make
sudo make install

# Copiar arquivos de configuração
cp php.ini-development /usr/local/php/php.ini
cp /usr/local/etc/php-fpm.d/www.conf.default /usr/local/etc/php-fpm.d/www.conf
cp sapi/fpm/php-fpm /usr/local/bin

#vim /usr/local/php/php.ini
#>> cgi.fix_pathinfo=0
sed -i "s/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/" /usr/local/php/php.ini


#vim /usr/local/etc/php-fpm.d/www.conf
#user = portal
#group = portal
sed -i "s/user = nobody/user = portal/" /usr/local/etc/php-fpm.d/www.conf
sed -i "s/group = nobody/group = portal/" /usr/local/etc/php-fpm.d/www.conf

# ativar servico
cp php-fpm.service /etc/systemd/system/
systemctl daemon-reload
systemctl enable php-fpm
# restartar nginx
systemctl reload nginx

# Nginx: configuração para PHP
#vim /usr/local/nginx/conf/nginx.conf
#location ~* \.php$ {
#    fastcgi_index   index.php;
#    fastcgi_pass    127.0.0.1:9000;
#    include         fastcgi_params;
#    fastcgi_param   SCRIPT_FILENAME    $document_root$fastcgi_script_name;
#    fastcgi_param   SCRIPT_NAME        $fastcgi_script_name;
#}

# testar instalação
#rm /usr/local/nginx/html/index.html
#echo "<?php phpinfo(); ?>" >> /usr/local/nginx/html/index.php

# Systemd files para nginx/php-fpm
#https://gist.github.com/magnetikonline/c1a214e12cdbc65df7c620bbbc3af6e8
