require 'spec_helper' 

describe 'selenium::node' do
  let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }
  
  it 'include selenium recipe' do 
    expect(chef_run).to include_recipe 'selenium'
  end

  it 'include google-chrome recipe' do 
    expect(chef_run).to include_recipe 'google-chrome'
  end  

  it 'include ark recipe' do 
    expect(chef_run).to include_recipe 'ark'
  end

  it 'add apt_repo' do
    expect(chef_run).to add_apt_repository 'opera'
  end

  %w(firefox xvfb opera).each do  |package|
    it "install package #{package}" do
      expect(chef_run).to install_package package
    end
  end

  it 'create user browser' do 
    expect(chef_run).to create_user 'browser'
  end 

  it 'create selenium user home' do
    expect(chef_run).to create_directory '/var/lib/browser'
  end

  it 'change chromedriver acceess right' do
    expect(chef_run).to create_file '/usr/local/bin/chromedriver'
  end
  
  (1..10).each do | num | 
    it 'render template[/etc/init/browser-node-#{num}.conf]' do 
      expect(chef_run).to render_file("/etc/init/browser-node-#{num}.conf").with_content('-role node')
    end 
    it 'service browser-node subscribed to template[/etc/init/browser-node-#{num}.conf]' do
      resource = chef_run.service("browser-node-#{num}")
      expect(resource).to subscribe_to("template[/etc/init/browser-node-#{num}.conf]").on(:restart).delayed
    end
  end
end