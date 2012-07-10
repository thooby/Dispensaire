# -*- encoding : utf-8 -*-
require 'test_helper'

class ConsultationTest < ActiveSupport::TestCase

  should belong_to :patient
  should belong_to :tipeconsultation
  should have_many :consul_diags
  should have_many :consul_trats
  should validate_presence_of :fecha 
  should validate_presence_of :patient_id
  should validate_presence_of :tipeconsultation_id 
  should validate_presence_of :motif 
  should validate_presence_of :consul_trats
  should validate_presence_of :consul_diags
  
end
