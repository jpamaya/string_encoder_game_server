# A random number generator wrapper (just in case we need stubbing)
# Uses the ruby PRNG internally
class RandomGenerator

  attr_accessor :random

  def initialize(seed = nil)
    @random = seed ? Random.new(seed) : Random.new
  end

  def random(range)
    @random.rand(range) rescue 0
  end

  def random_integers(number, range)
    integers = []
    number.times{ integers.push random(range) }
    integers
  end
end
