# database-upgrader-cookbook

Manages database schema updates by persisting what schema updates occur on the database in a Version table.

## Supported Platforms

Windows platforms with SQL Server installed

## Attributes

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td>['database_upgrader']['cache_path']</td>
    <td>String</td>
    <td>where to cache the database upgrader files</td>
    <td><tt>database_upgrader within the chef file cache directory</tt></td>
  </tr>
  <tr>
    <td>['database_upgrader']['cache_archive']</td>
    <td>String</td>
    <td>where the archive file that contains the DatabaseUpgrader.exe should be copied to</td>
    <td>DatabaseUpgrader.zip inside of the cache_path</td>
  </tr>
  <tr>
    <td>['database_upgrader']['install_directory']</td>
    <td>String</td>
    <td>where the database upgrader should be installed</td>
    <td>DatabaseUpgrader inside of the cache_path</td>
  </tr>
</table>

## Usage

On your application cookbook, use the resource:

```ruby
include_recipe 'database_upgrader' # to ensure that it's installed

database_upgrader_checked "make sure database is up to date" do
  connection_string 'Server=(local);Database=test;Integrated Security=SSPI'
  scripts_directory 'C:\\temp\\scripts'
  application_version '1.2.3.4'
end
```

## License and Authors

Author:: Michael Hedgpeth (mhedgpeth@gmail.com)
