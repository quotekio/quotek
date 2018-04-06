#!/bin/bash

PREFIX="/usr/local/quotek"

function usage() {

  echo -e "\nUsage: $0 <command [command_args]>\n"

  echo "Commands:"
  echo -e "\n\tall:\n\t\tBuilds and Installs all the quotek components at once."
  echo -e "\n\tcore:\n\t\tBuilds and Install the quotek engine in /usr/local."
  echo -e "\n\tinit:\n\t\tInstalls the build toolchain and fetches the required 3rd part libs."
  echo -e "\n\tinitdb <db_type>:\n\t\tInstalls specified Database. Db types: influx08, influx013, postgres."

}

########## BUILD FUNCTIONS ##########

# Builds Quotek Core engine.
function build_core() {
  pushd quotek-core
  cmake -DCMAKE_INSTALL_PREFIX=$PREFIX . && make -j3 && make install
  popd
}

#Builds QUotek SDK
function build_sdk() {
 pushd quotek-sdk
  cmake . && make -j3 && make install
  cpopd
}

# Builds the IG Markets REST Connector.
function build_ig() {
  pushd quotek-ig
  cmake . && make && make install
  popd
}

# Builds The Quotek Admin.
function build_admin() {
  echo "Installing quotek-admin With $1"
  pushd quotek-admin
  ./init.sh $1
  ./install.sh
  popd
}


# Installs and configure the specified Database.
function initdb() {

  git clone https://github.com/quotekio/db-archive
  pushd ./db-archive

  case $1 in

    influx08)
      dpkg -i influxdb_0.8.8_amd64.deb
      apt-get -f install
      /etc/init.d/influxdb start
    ;;

    influx013)
      dpkg -i influxdb_0.13.0_amd64.deb
      apt-get -f install
      /etc/init.d/influxdb start
    ;;

    postgres)
      apt-get -y update
      apt-get -y install postgresql-9.5 libpqxx-dev 

      ./../quptek-core/tools/init_pgsql.sh

    ;;
  esac

  popd
  rm -rf db-archive

}

# Installs the build toolchain along 
# with all the required 3rd part libs. 
function init() {

  apt-get -y install git
  git submodule update --init --recursive

  apt-get -y update
  apt-get -y install build-essential g++ cmake libasio-dev libcurl4-openssl-dev

  if [ ! -d /usr/include/rapidjson ] ;then
     git clone https://github.com/quotekio/rapidjson
     cp -r rapidjson/include/rapidjson /usr/include/
  fi

  if [ ! -d /usr/include/rapidxml ] ;then
     git clone https://github.com/quotekio/rapidxml
     cp -r rapidxml /usr/include/
  fi

  if [ ! -d /usr/local/include/websocketpp ] ;then
     git clone https://github.com/quotekio/websocketpp

     #builds websocketpp
     pushd websocketpp
     cmake .
     make && make install
     popd 
  fi

  # Creates symlink to make quotek SDK compile correctly
  ln -s `pwd`/sdk/src/eigen3/Eigen /usr/include/Eigen
  rm -rf websocketpp rapidjson rapidxml
}

# Performs the ultimate post-install tasks for quotek-core and quotek-admin.
function build_finish() {
  if [ ! -d /tmp/qate ] ;then
    mkdir /tmp/qate
  fi

  touch /var/log/qate.log
  chown -R www-data /tmp/qate
  chown www-data /var/log/qate.log
  echo "$PREFIX/lib" >> /etc/ld.so.conf.d/qate.conf
  chmod +x /etc/init.d/quotek
  ldconfig

  if [ -f /tmp/quotek_dbpasswd ] ;then

    dbpass=`cat /tmp/quotek_dbpasswd`

    echo "********************************************"
    echo "PASSWORD FOR QUOTEK DB: $dbpass"
    echo "********************************************"

    rm /tmp/quotek_dbpasswd

  fi

}


########## ENTRY POINT ###########

echo -e "\nQUOTEK SOLUTION BUILDER V3.0 -- Copyright 2013-2018, Clément Gamé"
echo    "==================================================================="

if [ $# -lt 1 ]
then
  usage 
  exit 1
fi

case $1 in

  init)
    init
  ;;

  initdb)
    initdb $2
  ;;


  all)
    init
    initdb postgres
    build_sdk
    build_ig
    build_core
    build_admin
    build_finish
  ;;

 
esac

