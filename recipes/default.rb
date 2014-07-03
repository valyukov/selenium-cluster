include_recipe 'apt'
include_recipe 'java'
include_recipe 'java::default_java_symlink'

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
