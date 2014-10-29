# Load app files
require_relative '../lib/app.rb'

# Configure RSpec
RSpec.configure do |config|
  config.filter_run :focus => true
  config.run_all_when_everything_filtered = true
end
