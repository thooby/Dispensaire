# -*- encoding : utf-8 -*-
require 'test_helper'

class GroupeTraitementTest < ActiveSupport::TestCase
  subject {FactoryGirl.create(:groupe_traitement)}
  
  should have_many :traitements 
  should validate_presence_of :description
  should validate_uniqueness_of :description
  
  should "be valid" do
    gt = FactoryGirl.build(:groupe_traitement)
    assert_equal true, gt.valid?
  end   
end
