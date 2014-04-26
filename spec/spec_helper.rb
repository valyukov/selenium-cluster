require 'chefspec'
require 'chefspec/berkshelf'
# require 'chefspec/cacher'

# Require all our libraries
Dir['spec/recipes/*.rb'].each { |f| require File.expand_path(f) }
