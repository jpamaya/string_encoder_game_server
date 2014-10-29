require_relative '../config/boot'

require 'sinatra/base'
require 'sinatra/reloader'

class StringEncoderGameServer < Sinatra::Base

  # Enable sinatra reloader
  configure :development do
    register Sinatra::Reloader
  end

  # Initial endpoint
  get '/word' do

  end

end
