default[:selenium][:url] = 'http://selenium-release.storage.googleapis.com/2.41/selenium-server-standalone-2.41.0.jar'

default[:selenium][:path] = '/opt/selenium/'
default[:selenium][:jar] = "#{node[:selenium][:path]}selenium-server-standalone.jar"

default[:selenium][:node][:user] = 'browser'
default[:selenium][:node][:instances] = (1..10).to_a
default[:selenium][:node][:start_port] = 5000
default[:selenium][:node][:java_opts] = '-Djava.security.egd=file:/dev/./urandom -Xmx256m'
default[:selenium][:node][:xvfb_size] = '1366x768x24'

default[:selenium][:hub][:user] = 'nobody'
default[:selenium][:hub][:host] = '127.0.0.1'
default[:selenium][:hub][:port] = 4444
default[:selenium][:hub][:url] = "http://#{node[:selenium][:hub][:host]}:#{node[:selenium][:hub][:port]}/"
default[:selenium][:hub][:java_opts] = '-Djava.security.egd=file:/dev/./urandom -Xmx512m'
default[:selenium][:hub][:options] = '-timeout 60 -browserTimeout 120'

default[:selenium][:chromedriver][:directory] = '/usr/local/bin'

case node[:kernel][:machine]
when 'x86_64'
	default[:selenium][:chromedriver][:url] = 'http://chromedriver.storage.googleapis.com/2.9/chromedriver_linux64.zip'
else
	default[:selenium][:chromedriver][:url] = 'http://chromedriver.storage.googleapis.com/2.9/chromedriver_linux32.zip'
end