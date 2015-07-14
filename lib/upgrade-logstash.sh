yum -q -y install screen

# Install JAVA
yum -q -y localinstall /vagrant/jdk-8u45-linux-x64.rpm


# Setting ES version to install
LOGSTASH_VERSION="logstash-1.5.2"

# Removing all previous potentially installed version
rm -rf logstash
rm -rf logstash-*

# Downloading the version to install
if [ ! -f "/vagrant/$LOGSTASH_VERSION.tar.gz" ]; then
    wget -q https://download.elastic.co/logstash/logstash/${LOGSTASH_VERSION}.tar.gz
    tar -zxf $LOGSTASH_VERSION.tar.gz
    rm -rf $LOGSTASH_VERSION.tar.gz
else
    tar -zxf /vagrant/$LOGSTASH_VERSION.tar.gz
fi

# Renaming extracted folder to a generic name to avoid changing commands 
mv $LOGSTASH_VERSION logstash
