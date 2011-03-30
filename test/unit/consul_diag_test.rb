require 'test_helper'

class ConsulDiagTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert ConsulDiag.new.valid?
  end
end
