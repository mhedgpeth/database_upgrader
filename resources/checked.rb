property :name, String, identity: true
property :connection_string, String
property :scripts_directory, String
property :application_version, String

recipe do 
	install_directory = node['database_upgrader']['install_directory']
	executable_path = "#{install_directory}/DatabaseUpgrader.exe"

	install_directory = node['database_upgrader']['install_directory']
	connection_string_arg = "\"-c#{connection_string}\""
	scripts_directory_arg = "\"-d#{scripts_directory}\""

	execute "DatabaseUpgrader_Initialized" do
		cwd install_directory
		command "#{executable_path} --initialize #{connection_string_arg}"
		only_if "#{executable_path} --requiresInitialize #{connection_string_arg}"
	end

	execute "DatabaseUpgrader" do
		cwd install_directory
		command "#{executable_path} #{connection_string_arg} #{scripts_directory_arg} \"-v#{application_version}\""
		only_if "#{executable_path} --requiresUpgrade #{connection_string_arg} #{scripts_directory_arg}"
	end
end