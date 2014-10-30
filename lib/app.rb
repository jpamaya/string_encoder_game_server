require_relative '../config/boot'
require_relative './encoder'
require_relative './random_generator'

require 'sinatra/base'
require 'sinatra/reloader'
require 'json'

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
    word_list.sample.strip
  end

  def decode_simple_random_obfuscate(word)
    first_word = word.split('')
    second_word = word.upcase.split('')
    new_word = ''
    first_word.each_with_index {|item, index|
      new_word += first_word[index] if first_word[index] == second_word[index]
    }
    new_word_number_decoded = new_word.tr('43106','aeiou')
    new_word_number_decoded.downcase
  end

  # Enable sinatra reloader
  configure :development do
    register Sinatra::Reloader
    also_reload File.expand_path('../encoder.rb', __FILE__)
    also_reload File.expand_path('../random_generator.rb', __FILE__)
  end

  # Initial endpoint Noop challenge
  get '/word' do
    puts 'noop'
    encoder.noop(new_word)
  end

  # Answer for the Noop challenge
  post "/:word" do
    encoded_word = params[:word].strip
    decoded_word = params[:answer].strip
    if encoder.noop(decoded_word) == encoded_word
      {result: "OK", next_url: '/XXCHA2XX/', clue: 'Look it at the mirror'}.to_json
    else
      {result: "FAIL"}.to_json
    end
  end

  # Reverse challenge
  get '/XXCHA2XX/word' do
    puts 'reverse'
    encoder.reverse(new_word)
  end

  # Answer for the Reverse challenge
  post "/XXCHA2XX/:word" do
    encoded_word = params[:word].strip
    decoded_word = params[:answer].strip
    if encoder.reverse(decoded_word) == encoded_word
      {result: "OK", next_url: '/CHLLNGTR33/', clue: 'Numbers mean other thing'}.to_json
    else
      {result: "FAIL"}.to_json
    end
  end

  # Vowels challenge
  get '/CHLLNGTR33/word' do
    puts 'Vowels'
    encoder.vowels_to_numbers(new_word)
  end

  # Answer for the Vowels challenge
  post "/CHLLNGTR33/:word" do
    encoded_word = params[:word].strip
    decoded_word = params[:answer].strip
    if encoder.vowels_to_numbers(decoded_word) == encoded_word
      {result: "OK", next_url: '/CHXXROT4XXGE/', clue: 'Words like a ring'}.to_json
    else
      {result: "FAIL"}.to_json
    end
  end

  # Rotation challenge
  get '/CHXXROT4XXGE/word' do
    puts 'Rotation'
    encoder.rotate(new_word, 2)
  end

  # Answer for the Rotation challenge
  post "/CHXXROT4XXGE/:word" do
    encoded_word = params[:word].strip
    decoded_word = params[:answer].strip
    if encoder.rotate(decoded_word, 2) == encoded_word
      {result: "OK", next_url: '/RANCH5SIOBSXX/', clue: 'word hidden and masked between pals'}.to_json
    else
      {result: "FAIL"}.to_json
    end
  end

  # Simple random obfuscate challenge
  get '/RANCH5SIOBSXX/word' do
    puts 'Rotation'
    encoder.simple_random_obfuscate(new_word)
  end

  # Answer for the Simple random obfuscate challenge
  post "/RANCH5SIOBSXX/:word" do
    encoded_word = params[:word].strip
    decoded_word = params[:answer].strip
    if decode_simple_random_obfuscate(encoded_word) == decoded_word
      {result: "OK"}.to_json
    else
      {result: "FAIL"}.to_json
    end
  end
end
