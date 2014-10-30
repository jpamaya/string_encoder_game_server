# This file groups all bundler dependencies available into the Gemfile
require 'rubygems'
ENV['BUNDLE_GEMFILE'] = File.expand_path('../../Gemfile', __FILE__) unless (File.exist?(ENV['BUNDLE_GEMFILE']) rescue nil)
require 'bundler/setup'

# Require the gems in the Gemfile
Bundler.require(:default) if defined?(Bundler)

# Require all initializers
Dir[File.expand_path('../initializers/*', __FILE__)].each do |file|
  require file
end
