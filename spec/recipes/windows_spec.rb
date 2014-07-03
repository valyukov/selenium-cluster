require 'spec_helper'

describe 'selenium-cluster::windows' do
  let(:chef_run) { ChefSpec::Runner.new(platform: 'windows', version: '2008R2').converge(described_recipe) }

  before(:all) do
    ENV['SYSTEMDRIVE'] = 'C:'
  end

  it 'include chocolatey::default' do
    expect(chef_run).to include_recipe 'chocolatey'
  end

  it 'include internet-explorer::defailt' do
    expect(chef_run).to include_recipe 'internet-explorer'
  end

  it 'add c:\\selenium to windows path' do
    expect(chef_run).to add_windows_path('c:\\selenium\\')
  end

  it 'create selenium jar' do
    expect(chef_run).to create_remote_file_if_missing 'c:\\selenium\\selenium-server-standalone.jar'
  end

  it 'selenium.jar notifies the windows_reboot' do
    resource = chef_run.remote_file('c:\\selenium\\selenium-server-standalone.jar')
    expect(resource).to notify('windows_reboot[30]').to(:request).delayed
  end

  it 'create selenium service' do
    expect(chef_run).to render_file('c:\\selenium\\selenium.cmd').with_content('platform=WINDOWS')
  end

  it 'add selenium service to autorun' do
    resource = chef_run.template('c:\\selenium\\selenium.cmd')
    expect(resource).to notify('windows_auto_run[selenium]').to(:create).immediately
  end
end
