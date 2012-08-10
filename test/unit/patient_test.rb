# -*- encoding : utf-8 -*-
require 'test_helper'

class PatientTest < ActiveSupport::TestCase
  subject {FactoryGirl.create(:patient)}
  
  should belong_to :sex  
  should belong_to :village
  should belong_to :commune
  should belong_to :ethnie
  should belong_to :profession  
  should have_many :consultations
  
  should validate_presence_of :prenom
  should validate_presence_of :nom
  should validate_presence_of :fecha
  should validate_presence_of :sex_id
  should validate_presence_of :naissance
  should validate_presence_of :village_id
  should validate_presence_of :commune_id
  should validate_presence_of :ethnie_id
  should validate_presence_of :profession_id
  should validate_presence_of :carte_code
  should validate_uniqueness_of :carte_code
  should validate_numericality_of :naissance
  
  should "be valid patient created" do
    patient = FactoryGirl.build(:patient)
    assert patient.valid?                    
  end
  
  should "find code" do
    patient = FactoryGirl.create(:patient, :carte_code => "1000A")
    assert_equal patient, Patient.find_code("1000A")
  end
  
  should "not destroy patient with consultations" do
    patient = FactoryGirl.create(:patient)
    2.times {FactoryGirl.create(:consultation, :patient => patient)}
    assert_no_difference 'Patient.count' do
      assert_equal false, patient.destroy
    end  
  end
end
