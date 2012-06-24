require 'test_helper'

class PatientTest < ActiveSupport::TestCase
  test "should_be_valid_patient_created" do
    actual = Patient.new(:prenom => "Issa", 
                         :nom => "Dembelé", 
                         :carte_code => "1534B", 
                         :fecha => "2011-09-03", 
                         :naissance => 1911,
                         :sex_id => 1, 
                         :village_id => 1, 
                         :commune_id => 1, 
                         :ethnie_id => 1, 
                         :profession_id => 1)
    assert actual.valid?                    
  end
  test "naissance_should_be_greater_than_or_equal_to_1910" do
    actual = Patient.new(:prenom => "Issa", 
                         :nom => "Dembelé", 
                         :carte_code => "1534B", 
                         :fecha => "2011-09-03", 
                         :naissance => 1909,
                         :sex_id => 1, 
                         :village_id => 1, 
                         :commune_id => 1, 
                         :ethnie_id => 1, 
                         :profession_id => 1)
    assert !actual.valid?                    
  end
  test "carte_code_should_be_unique" do
    actual0 = Patient.new(:prenom => "Issa", 
                          :nom => "Dembelé", 
                          :carte_code => "1534B", 
                          :fecha => "2011-09-03", 
                          :naissance => 1911,
                          :sex_id => 1, 
                          :village_id => 1, 
                          :commune_id => 1, 
                          :ethnie_id => 1,
                          :profession_id => 1)  
    actual0.save  
    actual = Patient.new(:prenom => "Djiara", 
                         :nom => "Djiarah", 
                         :carte_code => "1534B", 
                         :fecha => "2011-09-04", 
                         :naissance => 1981,
                         :sex_id => 2, 
                         :village_id => 1, 
                         :commune_id => 1, 
                         :ethnie_id => 1, 
                         :profession_id => 1)
   assert !actual.valid?                    
  end
  test "patient_must_have_prenom" do
    actual = Patient.new(:nom => "Dembelé", 
                         :carte_code => "1534B", 
                         :fecha => "2011-09-03", 
                         :naissance => 1911,
                         :sex_id => 1, 
                         :village_id => 1, 
                         :commune_id => 1, 
                         :ethnie_id => 1, 
                         :profession_id => 1)
     assert !actual.valid?                    
  end
  test "patient_must_have_nom" do
    actual = Patient.new(:prenom => "Issa",
                         :carte_code => "1534B", 
                         :fecha => "2011-09-03", 
                         :naissance => 1911,
                         :sex_id => 1, 
                         :village_id => 1, 
                         :commune_id => 1, 
                         :ethnie_id => 1, 
                         :profession_id => 1)
      assert !actual.valid?                    
  end  
  test "patient_must_have_carte_code" do
    actual = Patient.new(:prenom => "Issa", 
                         :nom => "Dembelé", 
                         :fecha => "2011-09-03", 
                         :naissance => 1911,
                         :sex_id => 1, 
                         :village_id => 1, 
                         :commune_id => 1, 
                         :ethnie_id => 1, 
                         :profession_id => 1)
    assert !actual.valid?                    
  end  
  test "patient_must_have_fecha" do
    actual = Patient.new(:prenom => "Issa", 
                         :nom => "Dembelé", 
                         :carte_code => "1534B", 
                         :naissance => 1911,
                         :sex_id => 1, 
                         :village_id => 1, 
                         :commune_id => 1, 
                         :ethnie_id => 1, 
                         :profession_id => 1)
    assert !actual.valid?                    
  end  
  test "patient_must_have_naissance" do
    actual = Patient.new(:prenom => "Issa", 
                         :nom => "Dembelé", 
                         :carte_code => "1534B", 
                         :fecha => "2011-09-03", 
                         :sex_id => 1, 
                         :village_id => 1, 
                         :commune_id => 1, 
                         :ethnie_id => 1, 
                         :profession_id => 1)
    assert !actual.valid?                    
  end  
  test "patient_must_have_sex_id" do
    actual = Patient.new(:prenom => "Issa", 
                         :nom => "Dembelé", 
                         :carte_code => "1534B", 
                         :fecha => "2011-09-03", 
                         :naissance => 1911,
                         :village_id => 1, 
                         :commune_id => 1, 
                         :ethnie_id => 1,         
                         :profession_id => 1)
    assert !actual.valid?                    
  end
  test "patient_must_have_village_id" do
    actual = Patient.new(:prenom => "Issa", 
                         :nom => "Dembelé", 
                         :carte_code => "1534B", 
                         :fecha => "2011-09-03", 
                         :naissance => 1911,
                         :sex_id => 1,  
                         :commune_id => 1, 
                         :ethnie_id => 1, 
                         :profession_id => 1)
    assert !actual.valid?                    
  end
  test "patient_must_have_commune_id" do
    actual = Patient.new(:prenom => "Issa", 
                         :nom => "Dembelé", 
                         :carte_code => "1534B", 
                         :fecha => "2011-09-03", 
                         :naissance => 1911,
                         :sex_id => 1, 
                         :village_id => 1,
                         :ethnie_id => 1, 
                         :profession_id => 1)
    assert !actual.valid?                    
  end
  test "patient_must_have_ethnie_id" do
    actual = Patient.new(:prenom => "Issa", 
                         :nom => "Dembelé", 
                         :carte_code => "1534B", 
                         :fecha => "2011-09-03", 
                         :naissance => 1911,
                         :sex_id => 1, 
                         :village_id => 1, 
                         :commune_id => 1, 
                         :profession_id => 1)
    assert !actual.valid?                    
  end
  test "patient_must_have_profession_id" do
    actual = Patient.new(:prenom => "Issa", 
                         :nom => "Dembelé", 
                         :carte_code => "1534B", 
                         :fecha => "2011-09-03", 
                         :naissance => 1911,
                         :sex_id => 1, 
                         :village_id => 1, 
                         :commune_id => 1, 
                         :ethnie_id => 1)
    assert !actual.valid?                    
  end
  test "find_code_find_codes" do
    assert_equal(Patient.find_code("12A"),patients(:one))
  end
  should belong_to :sex  
  should belong_to :village
  should belong_to :commune
  should belong_to :ethnie
  should belong_to :profession  
  should have_many :consultations
end
