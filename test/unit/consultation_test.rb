require 'test_helper'

class ConsultationTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Consultation.new.valid?
  end
end
