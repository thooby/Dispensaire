require 'test_helper'

class SexTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Sex.new.valid?
  end
  should_have_many :patients
end
