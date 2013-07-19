include_recipe 'apt'
include_recipe 'java::openjdk'

directory node[:selenium][:path] do
  owner "root"
  group "root"
  mode 00755
  action :create
end

remote_file node[:selenium][:jar] do
  source "http://selenium.googlecode.com/files/selenium-server-standalone-#{node[:selenium][:version]}.jar"
  action :create_if_missing
  mode 0644
end

user node[:selenium][:node][:user] do
  comment "Selenium user"
  system true
  home File.join('/var/lib/', node[:selenium][:node][:user])
  shell "/bin/false"
  action :create
end
