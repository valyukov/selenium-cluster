name             'selenium'
maintainer       'Vlad Alyukov'
maintainer_email 'valyukov@gmail.com'
license          'Apache 2.0'
description      'Installs/Configures Selenium WebDriver Grid2/Node'
version          '0.9.26'

supports 'ubuntu', '>= 12.04'

depends 'java', '= 1.22.0'
depends 'phantomjs', '= 1.0.3'

%w(ark  google-chrome apt chocolatey maven).each { |cb| depends cb }
