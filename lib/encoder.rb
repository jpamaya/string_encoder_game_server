class Encoder

  attr_accessor :generator

  def initialize(random_number_generator = nil)
    @generator = random_number_generator || RandomGenerator.new
  end

  # Does nothing to the inputted word
  #
  # @param [String] word some word
  # @return [String] the same word
  def noop(word)
    word
  end

  # Reverses the word
  #
  # @param [String] word some word
  # @return [String] the reversed word
  def reverse(word)
    word.reverse
  end

  # Substitutes vowels by numbers
  #
  # @param [String] word some word
  # @return [String] the word with vowels substituted by numbers
  def vowels_to_numbers(word)
    word.tr('aeiou','43106')
  end

  # Rotates the word letters (to the right)
  #
  # @param [String] word some word
  # @param [Integer] rotations the number of positions to shift each letter to the right
  # @return [String] the word with its letters rotated
  def rotate(word, rotations)
    word.split('').rotate(rotations).join
  end

  # Takes a word, applies vowels_to_numbers, uppercases it and generates random lowercase letters between the resulting characters
  #
  # @param [String] word some word
  # @return [String] the word with its letters rotated
  def simple_random_obfuscate(word)
    letters = vowels_to_numbers(word).upcase.split('')
    "#{random_obfuscation_segment}#{letters.join(random_obfuscation_segment)}#{random_obfuscation_segment}"
  end

  # Takes a word and substitutes any vowels with asterisks '*'
  #
  # @param [String] word some word
  # @return [String] the word with no vowels, just asterisks ('*') in place
  def vowel_obfuscate(word)
    word.tr('aeiou', '*')
  end

  def random_obfuscation_segment
    indexes = generator.random_integers(generator.random(7..15), generator.random(0..(alphabet.size)))
    alphabet.values_at(*indexes).join
  end

  # Applies alphabetic rotation (caesar algorithm) to the word
  #
  # @param [String] word some word
  # @param [Integer] rotations the alphabetic shift for each letter
  # @return [String] the word encoded with caesar
  def caesar_encode(word, rotations)
    letters = word.split('')
    letter_indexes = letters.map{|letter| alphabet.index(letter)}
    rotated_alphabet = alphabet.rotate(rotations)
    rotated_alphabet.values_at(*letter_indexes).join
  end

  # The common alphabet for use in this project
  #
  # @return [Array] the alphabet
  def alphabet
    ('a'..'z').to_a
  end

end
