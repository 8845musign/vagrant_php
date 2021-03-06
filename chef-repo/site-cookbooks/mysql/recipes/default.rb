#
# Cookbook Name:: mysql
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
#
%w{mysql-client mysql-devel mysql-server}.each do |pkg|
  package pkg do
    action :install
  end
end

template "/etc/my.cnf" do
  source "my.cnf.erb"
  owner "root"
  group "root"
  mode 0644
end

service 'mysqld' do
  supports :status => true, :restart => true, :reload => true
  action [ :enable, :start ]
end