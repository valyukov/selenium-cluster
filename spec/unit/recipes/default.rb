require 'spec_helper'

describe 'selenium::default' do
  let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }
  it 'include apt recipe' do 
    expect(chef_run).to include_recipe 'apt'
  end

  it 'include java::default recipe' do 
    expect(chef_run).to include_recipe 'java::default'
  end 

  it 'include java::openjdk recipe' do 
    expect(chef_run).to include_recipe 'java::openjdk'
  end 

  it 'create selenium directory' do
    expect(chef_run).to create_directory '/opt/selenium/'
  end

  it 'create selenium jar' do
    expect(chef_run).to create_remote_file '/opt/selenium/selenium-server-standalone.jar'
  end
end