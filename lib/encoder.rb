class Encoder

  # Does nothing to the inputted word
  #
  # @param [String] a word
  # @return [String] the same word
  def noop(word)
    word
  end

  # Reverses the word
  #
  # @param [String] a word
  # @return [String] the reversed word
  def reverse(word)
    word.reverse
  end

  # Substitutes vowels by numbers
  #
  # @param [String] a word
  # @return [String] the word with vowels substituted by numbers
  def vowels_to_numbers(word)
    word.gsub(/[aeiou]/, {a: '4', e: '3', i: '1', o: '0', u: '6'}.stringify_keys)
  end

end
