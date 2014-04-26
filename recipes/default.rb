include_recipe 'apt'
include_recipe 'java::default'
include_recipe 'java::openjdk'

directory node[:selenium][:path] do
  owner 'root'
  group 'root'
  mode 00755
  action :create
end

remote_file node[:selenium][:jar] do
  source node[:selenium][:url]
  action :create
  mode 0644
end
