require 'test_helper'

class ProfessionTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Profession.new(:nom =>"Agriculteur").valid?
  end
  should have_many :patients
  should validate_presence_of :nom
  should validate_uniqueness_of :nom
  
end
