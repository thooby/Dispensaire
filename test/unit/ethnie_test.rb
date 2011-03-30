require 'test_helper'

class EthnieTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Ethnie.new.valid?
  end
end
