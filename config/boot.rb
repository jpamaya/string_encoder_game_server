# This file groups all bundler dependencies available into the Gemfile
require 'rubygems'
require 'bundler/setup' if File.exist?(ENV['BUNDLE_GEMFILE'])

# Require the gems in the Gemfile
Bundler.require(:default) if defined?(Bundler)

# Require all initializers
Dir[File.expand_path('../initializers/*', __FILE__)].each do |file|
  require file
end
