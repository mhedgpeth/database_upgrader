default['database_upgrader']['cache_path'] = "#{Chef::Config[:file_cache_path]}/database_upgrader"
default['database_upgrader']['cache_archive'] = "#{node['database-upgrader']['cache_path']}/DatabaseUpgrader.zip"
default['database_upgrader']['install_directory'] = "#{node['database-upgrader']['cache_path']}/DatabaseUpgrader"