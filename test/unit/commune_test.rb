require 'test_helper'
class CommuneTest < ActiveSupport::TestCase
  
  def test_should_be_valid
    assert Commune.new(:nom => "Diedougou").valid?
  end
  should have_many(:patients)
  should have_many(:villages)
  should validate_presence_of(:nom)  
end
