require 'spec_helper'

describe 'selenium::hub' do
  let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }
  
  it 'include selenium recipe' do 
    expect(chef_run).to include_recipe 'selenium'
  end

  it 'enable service hub' do
    expect(chef_run).to enable_service 'hub'
  end

  it 'start service hub' do
    expect(chef_run).to start_service 'hub'
  end

  it 'render template[/etc/init/hub.conf]' do
    expect(chef_run).to render_file('/etc/init/hub.conf').with_content('-role hub')
  end

  it 'service hub subscribed to template[/etc/init/hub.conf]' do
    resource = chef_run.service('hub')
    expect(resource).to subscribe_to('template[/etc/init/hub.conf]').on(:restart).immediately
  end
  
end
