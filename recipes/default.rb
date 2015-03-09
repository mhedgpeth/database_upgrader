#
# Cookbook Name:: database-upgrader
# Recipe:: default
#
# Copyright (C) 2015 Michael Hedgpeth
#
# All rights reserved - Do Not Redistribute
#

database_upgrader_name = "DatabaseUpgrader.zip" 
cached_database_upgrader = node['database_upgrader']['cache_archive']

directory node['database_upgrader']['cache_path']

cookbook_file database_upgrader_name do
	path cached_database_upgrader
	notifies :unzip, "windows_zipfile[unzip_database_upgrader]", :immediately
end

windows_zipfile 'unzip_database_upgrader' do
	path node['database_upgrader']['install_directory']
	source cached_database_upgrader
	overwrite true
	action :nothing
end