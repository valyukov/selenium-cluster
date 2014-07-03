case node[:kernel][:machine]
when 'x86_64'
  default[:selenium][:iedriver][:url] = 'http://selenium-release.storage.googleapis.com/2.42/IEDriverServer_x64_2.42.0.zip'
else
  default[:selenium][:iedriver][:url] = 'http://selenium-release.storage.googleapis.com/2.42/IEDriverServer_Win32_2.42.0.zip'
end
