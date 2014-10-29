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
  # @return [String] the same word
  def reverse(word)
    word.reverse
  end

end
