require 'sir_trevor_rails'
require 'minitest'
require 'minitest/unit'
require 'minitest/autorun'
require 'minitest/pride'
require 'wrong/adapters/minitest'
require 'factory'

class MiniTest::Test
  include Wrong::Assert
  include Wrong::Helpers

  def failure_class
    MiniTest::Assertion
  end

  def aver(valence, explanation = nil, depth = 0)
    self.assertions += 1 # increment minitest's assert count
    super(valence, explanation, depth + 1) # apparently this passes along the default block
  end

end
