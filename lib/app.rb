require_relative '../config/boot'
require_relative './encoder'
require_relative './random_generator'

require 'sinatra/base'
require 'sinatra/reloader'

class StringEncoderGameServer < Sinatra::Base

  attr_accessor :requests
  attr_accessor :encoder

  def initialize
    @encoder = Encoder.new
    super
  end

  # Enable sinatra reloader
  configure :development do
    register Sinatra::Reloader
    also_reload File.expand_path('../encoder.rb', __FILE__)
    also_reload File.expand_path('../random_generator.rb', __FILE__)
  end

  # Initial endpoint
  get '/word' do
    "Encoder is: #{@encoder}"
  end

end
