require 'test_helper'

class GroupeTraitementTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert GroupeTraitement.new.valid?
  end
  should_have_many :traitements  
end
