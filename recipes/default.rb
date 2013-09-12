#
# Cookbook Name:: yate
# Recipe:: default
#
# Copyright (C) 2013 Sous
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'git'

directory "/opt/debs"

git '/opt/debs/yate-precise' do
  repository "https://github.com/sous/yate-precise.git"
  reference 'master'
  action :sync
end

execute 'apt-key add /opt/debs/yate-precise/apt-key.gpg' do
  command 'cat /opt/debs/yate-precise/apt-key.gpg | apt-key add -'
end

include_recipe 'apt'

apt_repository 'yate-precise' do
  uri 'file:///opt/debs/yate-precise'
  distribution node['lsb']['codename']
  components ["main"]
  action :add
end

