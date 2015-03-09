default['database-upgrader']['cache_path'] = "#{Chef::Config[:file_cache_path]}/database-upgrader"
default['database-upgrader']['cache_archive'] = "#{node['database-upgrader']['cache_path']}/DatabaseUpgrader.zip"
default['database-upgrader']['install_directory'] = "#{node['database-upgrader']['cache_path']}/DatabaseUpgrader"