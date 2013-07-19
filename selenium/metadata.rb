name             'selenium'
maintainer       'Vlad Alyukov'
maintainer_email 'valyukov@gmail.com'
license          'Apache 2.0'
description      'Installs/Configures Selenium/Phantomjs'
version          '0.4.8'

%w(debian ubuntu).each do |os|
  supports os
end

%w{ark phantomjs google-chrome apt java nginx}.each { |cb| depends cb }

