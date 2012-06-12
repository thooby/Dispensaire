require 'test_helper'

class VillageTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Village.new.valid?
  end
  should_have_many :patients
  should_belong_to :commune
end
