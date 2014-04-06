default[:selenium][:phantomjs][:user] = 'nobody'
default[:selenium][:phantomjs][:instances] = (1..10).to_a
default[:selenium][:phantomjs][:start_port] = 8000