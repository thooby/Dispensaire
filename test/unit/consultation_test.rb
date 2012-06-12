require 'test_helper'

class ConsultationTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Consultation.new.valid?
  end
  should_belong_to :patient
  should_belong_to :tipeconsultation
  should_have_many :consul_diags
  should_have_many :consul_trats
end
