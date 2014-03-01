#!/bin/bash

yum -y install rubygems ruby-devel gcc
gem install --no-ri --no-rdoc puppet
gem install --no-ri --no-rdoc librarian-puppet
librarian-puppet install

yum-config-manager --enable epel

puppet apply --modulepath=modules/ manifests/default.pp