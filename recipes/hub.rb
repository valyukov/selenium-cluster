include_recipe 'selenium'

template '/etc/init/hub.conf' do
  source 'hub.conf.erb'
  variables(
        :user => node[:selenium][:hub][:user],
        :port => node[:selenium][:hub][:port],
        :java_opts => node[:selenium][:hub][:java_opts],
        :options => node[:selenium][:hub][:options],
  )
end

service 'hub' do
  provider Chef::Provider::Service::Upstart
  supports :status => true, :restart => true
  action [ :enable, :start ]
  subscribes :restart, 'template[/etc/init/hub.conf]', :immediately
end
