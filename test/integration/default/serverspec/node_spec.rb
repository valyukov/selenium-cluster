require_relative '../../../kitchen/data/spec_helper'

describe user('browser') do
  it { should exist }
end

(1..10).each do | n |
  describe service("browser-node-#{n}") do
    it { should be_enabled }
    it { should be_running }
  end
end

(5001..5010).each do | port |
  describe port(port) do
    it { should be_listening }
  end
end

%w(opera openjdk-7-jdk xvfb firefox google-chrome-stable).each do | package |
  describe package(package) do
    it { should be_installed }
  end
end

describe file('/opt/selenium/') do
  it { should be_directory }
end

describe file('/opt/selenium/selenium-server-standalone.jar') do
  it { should be_file }
end

describe file('/usr/local/bin/chromedriver') do
  it { should be_file }
end
