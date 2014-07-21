include_recipe 'chocolatey'
include_recipe 'internet-explorer'
include_recipe 'windows'

chocolatey 'javaruntime'

reboot = 'windows_reboot[30]'

windows_zipfile node[:selenium][:path] do
  source node[:selenium][:iedriver][:url]
  action :unzip
  not_if { ::File.exist?("#{node[:selenium][:path]}IEDriverServer.exe") }
  notifies :request, reboot, :delayed
end

remote_file node[:selenium][:jar] do
  source node[:selenium][:url]
  action :create_if_missing
  notifies :request, reboot, :delayed
end

windows_path node[:selenium][:path] do
  action :add
end

selenium_cmd = "#{node[:selenium][:path]}selenium.cmd"

template selenium_cmd do
  source 'selenium.cmd.erb'
  variables(
   hub: "#{node[:selenium][:hub][:url]}grid/register",
   jar: node[:selenium][:jar],
   version: node[:ie][:version],
   )
  notifies :create, 'windows_auto_run[selenium]', :immediately
end

windows_auto_run 'selenium' do
  program selenium_cmd
  not_if { Registry.value_exists?(AUTO_RUN_KEY, 'selenium') }
  action :nothing
  notifies :request, reboot, :delayed
end

windows_reboot 30 do
  reason 'Update selenium runner'
  action :nothing
end
