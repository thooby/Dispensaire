# -*- encoding : utf-8 -*-
require 'test_helper'
class CommuneTest < ActiveSupport::TestCase
  subject {FactoryGirl.create(:commune)}
  
  should have_many(:patients)
  should have_many(:villages)
  should validate_presence_of(:nom)  
  should validate_uniqueness_of(:nom)    
    
  should "be valid" do
    commune = FactoryGirl.build(:commune)
    assert_equal true, commune.valid?
  end
    
end
