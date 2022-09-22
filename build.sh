# !/bin/sh

set -ex

# pandoc installation
wget https://github.com/jgm/pandoc/releases/download/2.19.2/pandoc-2.19.2-linux-amd64.tar.gz
tar -xvzf pandoc-2.19.2-linux-amd64.tar.gz
mv pandoc-2.19.2/bin/pandoc /usr/local/bin/

# clone pg-cloudflare, and installation
git clone https://github.com/cloudflare/cf-pgbouncer.git
cd cf-pgbouncer
git submodule init 
git submodule update
./autogen.sh
./configure --build x86_64 --host x86_64 --target x86_64 ...
make
make install
