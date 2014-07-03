require_relative '../../../kitchen/data/spec_helper'

describe user('browser') do
  it { should exist }
end

describe service('hub') do
  it { should be_enabled }
  it { should be_running }
end

describe port(4444) do
  it { should be_listening }
end

describe file('/opt/selenium/') do
  it { should be_directory }
end

describe file('/opt/selenium/selenium-server-standalone.jar') do
  it { should be_file }
end
