#!/bin/bash
#
# Dependencias utilizadas para compilar outras aplicativos
#

#!/usr/bin/env bash

#yum -y update

sudo -E yum -y group install "Development Tools"
sudo -E yum -y install curl-devel expat-devel gettext-devel openssl-devel perl-devel zlib-devel asciidoc xmlto docbook2X wget libyaml-devel perl-Digest-SHA postfix libicu-devel libicu cmake gcc

