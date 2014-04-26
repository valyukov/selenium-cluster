require_relative '../../../kitchen/data/spec_helper'

(1..10).to_a.each do | n |
  describe service("phantomjs-#{n}") do
    it { should be_enabled }
    it { should be_running }
  end
end

(8001..8010).to_a.each do | port |
  describe port(port) do
    it { should be_listening }
  end
end

describe file('/usr/local/bin/phantomjs') do
  it { should be_file }
end

describe process('phantomjs') do
  it { should be_running }
end
