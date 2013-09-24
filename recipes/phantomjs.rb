include_recipe 'phantomjs::source'

node[:selenium][:phantomjs][:instances].each do | number |
	job = "phantomjs-#{number}"

	template "/etc/init/#{job}.conf" do
  		source "phantomjs.conf.erb"
  		variables(
                         :hub_url => node[:selenium][:hub][:url],
                         :port    => number + node[:selenium][:phantomjs][:start_port],
        )
	end

	service	job do
		provider Chef::Provider::Service::Upstart
		supports :restart => true
		action [ :enable, :start ]
		subscribes :reload, "template[/etc/init/#{job}.conf]", :delayed
	end

end

