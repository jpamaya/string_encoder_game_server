# Load utilities
require 'awesome_print'
# Load app files
require_relative '../lib/app.rb'

# Load support files
Dir[File.expand_path('../support/*', __FILE__)].each do |file|
  require file
end

# Configure RSpec
RSpec.configure do |config|
  config.filter_run :focus => true
  config.run_all_when_everything_filtered = true
end
