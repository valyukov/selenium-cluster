require 'spec_helper'

describe 'selenium-cluster::default' do
  let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }
  it 'include apt recipe' do
    expect(chef_run).to include_recipe 'apt'
  end

  it 'include java recipe' do
    expect(chef_run).to include_recipe 'java'
  end

  it 'include java::default_java_symlink recipe' do
    expect(chef_run).to include_recipe 'java::default_java_symlink'
  end

  it 'create selenium directory' do
    expect(chef_run).to create_directory '/opt/selenium/'
  end

  it 'create selenium jar' do
    expect(chef_run).to create_remote_file '/opt/selenium/selenium-server-standalone.jar'
  end
end
