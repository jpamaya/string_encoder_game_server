require_relative '../config/boot'
require_relative './encoder'

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
  end

  # Initial endpoint
  get '/word' do
    "Encoder is: #{@encoder}"
  end

end
