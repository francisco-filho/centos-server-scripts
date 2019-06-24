#!/usr/bin/env bash

DOWNLOAD_DIR=/dados/Downloads
DATA_DIR=/dados/postgres/9.6/data

cd $DOWNLOAD_DIR
wget https://download.postgresql.org/pub/repos/yum/9.6/redhat/rhel-7-x86_64/pgdg-redhat96-9.6-3.noarch.rpm

# configura repositório
rpm -i pgdg-redhat96-9.6-3.noarch.rpm
yum -y update
yum -y install postgresql96.x86_64 postgresql96-{server,contrib,devel,libs,python,plpython}.x86_64

# criar estrutura de diretórios
mkdir -p $DATA_DIR
chown -R postgres /dados/postgres
cd /dados/postgres

# inicia banco de dados vazio
sudo -u postgres /usr/pgsql-9.6/bin/initdb -D /dados/postgres/9.6/data --lc-collate="en_US.UTF-8" --lc-ctype="en_US.UTF-8"

# altera configuração apontando diretório para pasta correta
sed -i "s/PGDATA=.*$/PGDATA=\/dados\/postgres\/9\.6\/data\//" /usr/lib/systemd/system/postgresql-9.6.service

# instala/reinicia o serviço
systemctl enable postgresql-9.6.service
systemctl daemon-reload
service postgresql-9.6 start

# cria usuário
#sudo -u postgres psql -d postgres -c "ALTER ROLE postgres WITH ENCRYPTED PASSWORD '12345678';"
