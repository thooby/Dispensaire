require 'test_helper'

class PatientTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Patient.new.valid?
  end
end
