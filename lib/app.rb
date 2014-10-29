require_relative '../config/boot'
require_relative './encoder'
require_relative './random_generator'

require 'sinatra/base'
require 'sinatra/reloader'

class StringEncoderGameServer < Sinatra::Base

  attr_accessor :requests
  attr_accessor :encoder

  attr_accessor :word_list

  def initialize
    # initialize an encoder
    @encoder = Encoder.new

    # initialize empty words list
    @word_list = []

    # Initialize the words list to have in memory
    words_file = File.expand_path('../../config/dictionaries/words-es.txt', __FILE__)
    File.foreach(words_file).map{|word| @word_list.push(word)}
    super
  end

  def new_word
    word_list.sample
  end

  # Enable sinatra reloader
  configure :development do
    register Sinatra::Reloader
    also_reload File.expand_path('../encoder.rb', __FILE__)
    also_reload File.expand_path('../random_generator.rb', __FILE__)
  end

  # Initial endpoint
  get '/word' do
    encoder.noop(new_word)
  end

end
