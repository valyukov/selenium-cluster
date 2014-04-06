include_recipe 'selenium'
include_recipe 'apt'
include_recipe 'google-chrome'
include_recipe 'ark'

apt_repository 'opera' do
    uri 'http://deb.opera.com/opera/'
    distribution 'stable'
    components ['non-free']
    key 'http://deb.opera.com/archive.key'
    action :add
end

package 'firefox'
package 'xvfb'
package 'opera'

user_dir = File.join('/var/lib/', node[:selenium][:node][:user])

user node[:selenium][:node][:user] do
  comment 'Selenium  WebDriver user'
  system true
  home user_dir
  shell '/bin/false'
  action :create
end

directory user_dir do
  owner node[:selenium][:node][:user]
  group node[:selenium][:node][:user]
  action :create
end

ark 'chromedriver' do
    url node[:selenium][:chromedriver][:url]
    path node[:selenium][:chromedriver][:directory]
    creates 'chromedriver'
    action :cherry_pick
end

file File.join(node[:selenium][:chromedriver][:directory],  'chromedriver') do
  mode 00755
end 

node[:selenium][:node][:instances].each do | number |
	job = "browser-node-#{number}"

	template "/etc/init/#{job}.conf" do
  		source 'node.conf.erb'
  		variables(
        :hub_url       => "#{node[:selenium][:hub][:url]}grid/register",
        :user          => node[:selenium][:node][:user],
        :xvfb_size     => node[:selenium][:node][:xvfb_size],
        :java_opts     => node[:selenium][:node][:java_opts],
        :port          => number + node[:selenium][:node][:start_port],
        )
	end
	
	service	job do
		provider Chef::Provider::Service::Upstart
		supports :restart => true
		action [ :enable, :start ]
		subscribes :restart, "template[/etc/init/#{job}.conf]", :delayed
	end
end

