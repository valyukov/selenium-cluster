require 'spec_helper'

describe 'selenium-cluster::phantomjs' do
  let(:chef_run) { ChefSpec::Runner.new(platform: 'ubuntu', version: '12.04').converge(described_recipe) }

  before(:all) do 
    stub_command("which nginx").and_return('/usr/bin/nginx')
  end

  it 'include phantomjs::source recipe' do
    expect(chef_run).to include_recipe 'phantomjs::source'
  end

  (1..10).each do | num |
    it 'render template[/etc/init/phantomjs-#{num}.conf]' do
      expect(chef_run).to render_file("/etc/init/phantomjs-#{num}.conf").with_content('--webdriver-selenium-grid-hub=')
    end
    it 'service phantomjs subscribed to template[/etc/init/phantomjs-#{num}.conf]' do
      resource = chef_run.service("phantomjs-#{num}")
      expect(resource).to subscribe_to("template[/etc/init/phantomjs-#{num}.conf]").on(:restart).delayed
    end
  end
end
