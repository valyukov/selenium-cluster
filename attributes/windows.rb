case node[:kernel][:machine]
when 'x86_64'
  default[:selenium][:iedriver][:url] = 'http://selenium.googlecode.com/files/IEDriverServer_x64_2.39.0.zip'
else
  default[:selenium][:iedriver][:url] = 'http://selenium.googlecode.com/files/IEDriverServer_Win32_2.39.0.zip'
end
