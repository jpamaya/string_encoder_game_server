class Encoder

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
    word.gsub(/[aeiou]/, {a: '4', e: '3', i: '1', o: '0', u: '6'}.stringify_keys)
  end

  # Applies alphabetic rotation (caesar algorithm) to the word
  #
  # @param [String] word some word
  # @param [Integer] rotations the number of positions to shift each letter to the right
  # @return [String] the word with its letters rotated
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
