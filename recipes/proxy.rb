include_recipe "nginx"

template "#{node[:nginx][:dir]}/sites-available/selenium.conf" do
  source "selenium.nginx.conf.erb"
  owner  "root"
  group  "root"
  mode   "0644"
  variables(
    :listen_port     => node[:selenium][:proxy][:port],
    :fqdn            => node[:fqdn],
    :server_options  => node[:selenium][:proxy][:server][:options],
    :proxy_options   => node[:selenium][:proxy][:options],
    :proxy_pass      => "http://#{node[:selenium][:hub][:host]}:#{node[:selenium][:hub][:port]}/"
  )
end 

nginx_site 'selenium.conf' do
  timing :immediately
end
