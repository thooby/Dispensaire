require 'test_helper'

class VillageTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Village.new.valid?
  end
end
