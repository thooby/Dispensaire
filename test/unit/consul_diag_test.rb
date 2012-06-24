require 'test_helper'

class ConsulDiagTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert ConsulDiag.new(:diagnostic_id => 1, :consultation_id => 1).valid?
  end
  should belong_to :consultation
  should belong_to :diagnostic
  should validate_presence_of :diagnostic_id
  should validate_presence_of :consultation_id
end
