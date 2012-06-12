require 'test_helper'

class ProfessionTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Profession.new.valid?
  end
  should_have_many :patients
end
