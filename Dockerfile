from ubuntu:12.04
maintainer KazuyukiMori <mainya@gmail.com>

# make sure the package repository is up to date
run echo 'export PS1="\[\e[1;34m\][\u@\h:\w]\#\[\e[00m\] "' >> ~/.bashrc

# set max file descrpter
run ulimit -n 4096

# set locale
run locale-gen en_US.UTF-8
run update-locale LANG=en_US.UTF-8
env DEBIAN_FRONTEND noninteractive
env LC_ALL C
env LC_ALL en_US.UTF-8

# make sure the package repository is up to date
run echo "deb http://us.archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
run apt-get update

# install dev tools
run apt-get install -y vim wget curl sudo lsb-release logrotate libpopt0 cron
run apt-get install -y wget curl build-essential libssl-dev zlib1g-dev git build-essential libssl-dev python-software-properties python g++ make
run apt-get update && apt-get upgrade

# install Ruby 2.0.0-p247
run apt-get -y install build-essential zlib1g-dev libssl-dev libreadline6-dev libyaml-dev curl
run curl -L ftp://ftp.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p247.tar.bz2 | tar -xj -C /tmp
run cd /tmp/ruby-2.0.0-p247 && ./configure --disable-install-doc && make install clean


run gem update --system

run rm -r /tmp/ruby-2.0.0-p247
run gem install bundler


#Install node.js
run apt-get install -y python-dev build-essential zlib1g-dev libssl-dev libreadline6-dev libyaml-dev curl
run curl -L http://nodejs.org/dist/v0.10.5/node-v0.10.5.tar.gz | tar -xz -C /tmp
run cd /tmp/node-v0.10.5 && ./configure && make install clean

# Clean up
run rm -rf /tmp/node-v0.10.5
#Test it
run node -v

# install kandan
run apt-get install -y git libxml2-dev libpq-dev libsqlite3-dev
run git clone https://github.com/kandanapp/kandan/ /kandan
run (cd /kandan/ ; bundle install)
run (cd /kandan/ ; bundle exec rake db:create db:migrate kandan:bootstrap)

expose 80 8080 3000
add run.sh /usr/bin/kandan
entrypoint ["/usr/bin/kandan"]

