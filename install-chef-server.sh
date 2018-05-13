#!/bin/bash

# create staging directories
if [ ! -d /drop ]; then
  mkdir /drop
fi

# install Chef server
if [ ! $(which chef-server-ctl) ]; then
  echo "Installing Chef server..."
  rpm -i /vagrant/chef-server-core-12.17.33-1.el7.x86_64.rpm
  chef-server-ctl reconfigure --accept-license

  echo "Waiting for services..."
  until (curl -D - http://localhost:8000/_status) | grep "200 OK"; do sleep 15s; done
  while (curl http://localhost:8000/_status) | grep "fail"; do sleep 15s; done

  echo "Creating initial user and organization..."
  chef-server-ctl user-create chefadmin Chef Admin admin@4thcoffee.com insecurepassword --filename /drop/chefadmin.pem
  chef-server-ctl org-create 4thcoffee "Fourth Coffee, Inc." --association_user chefadmin --filename 4thcoffee-validator.pem


  echo "Your Chef server is ready!"

# Install chef manage
  echo "Install chef manage"
  rpm -i /vagrant/chef-manage-2.5.15-1.el7.x86_64.rpm
  chef-server-ctl reconfigure --accept-license
  chef-manage-ctl reconfigure --accept-license
fi

