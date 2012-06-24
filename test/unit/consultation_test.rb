require 'test_helper'

class ConsultationTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Consultation.new(:fecha => "01/01/01",:patient_id => 1, :tipeconsultation_id => 1,:motif => "Fievre").valid?
  end
  should belong_to :patient
  should belong_to :tipeconsultation
  should have_many :consul_diags
  should have_many :consul_trats
  should validate_presence_of :fecha 
  should validate_presence_of :patient_id
  should validate_presence_of :tipeconsultation_id 
  should validate_presence_of :motif 
end
