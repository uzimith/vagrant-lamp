#
# Cookbook Name:: create-virtualhost
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
include_recipe "apache2"
include_recipe "database::mysql"

# Create a virtualhost
web_app "my_app" do
  server_name node['vhost']['fqdn']
  server_aliases []
  docroot node['vhost']['root_dir']
end

# Create a mysql database
mysql_connection_info = {:host => "localhost",
                         :username => 'root',
                         :password => node['mysql']['server_root_password']}

mysql_database node['vhost']['db'] do
  connection mysql_connection_info
  action :create
end

mysql_database_user node['vhost']['db_user'] do
  connection mysql_connection_info
  password node['vhost']['db_pass']
  database_name node['vhost']['db']
  privileges [:all]
  action [:create, :grant]
end

