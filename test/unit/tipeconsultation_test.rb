require 'test_helper'

class TipeconsultationTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Tipeconsultation.new.valid?
  end
end