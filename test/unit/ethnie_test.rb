require 'test_helper'

class EthnieTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Ethnie.new(:nom => "Bambara").valid?
  end
  should have_many :patients  
  should validate_presence_of :nom
  should validate_uniqueness_of :nom
  
end
