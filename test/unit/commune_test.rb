require 'test_helper'

class CommuneTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Commune.new.valid?
  end
end
