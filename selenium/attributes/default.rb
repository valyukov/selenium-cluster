default[:selenium][:version] = '2.35.0'
default[:selenium][:path] = '/opt/selenium/'
default[:selenium][:jar] = "#{node[:selenium][:path]}selenium-server-standalone.jar"


default[:selenium][:node][:user] = 'browser'
default[:selenium][:node][:instances] = Array(1..10)
default[:selenium][:node][:start_port] = 5000
default[:selenium][:node][:java_opts] = '-Djava.security.egd=file:/dev/./urandom -Xmx256m'
default[:selenium][:node][:xvfb_size] = '1440x990x24'


default[:selenium][:hub][:user] = 'nobody'
default[:selenium][:hub][:host] = '127.0.0.1'
default[:selenium][:hub][:port] = 4444

# Overide this if you create not 'all in one' node 
default[:selenium][:hub][:url] = "http://#{node[:selenium][:hub][:host]}:#{node[:selenium][:hub][:port]}/"
default[:selenium][:hub][:java_opts] = '-Djava.security.egd=file:/dev/./urandom -Xmx512m'
default[:selenium][:hub][:options] = '-timeout 60 -browserTimeout 120'


default[:selenium][:chromedriver][:directory]
default[:selenium][:chromedriver][:directory] = '/usr/local/bin'

default[:selenium][:proxy][:port] = 80
default[:selenium][:proxy][:server][:options] = [
  "client_max_body_size 200M",
  "client_body_buffer_size 512k",
  "keepalive_timeout 0"
]
default[:selenium][:proxy][:options]  = [
  "proxy_redirect  http://#{node[:ipaddress]}:#{node[:selenium][:hub][:port]}/ /",
]

case node[:kernel][:machine]
when 'x86_64'
	default[:selenium][:chromedriver][:url] = 'http://chromedriver.googlecode.com/files/chromedriver_linux64_2.3.zip'
else
	default[:selenium][:chromedriver][:url] = 'http://chromedriver.googlecode.com/files/chromedriver_linux32_2.3.zip'
end
