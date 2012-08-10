# -*- encoding : utf-8 -*-
require 'test_helper'

class VillageTest < ActiveSupport::TestCase
  subject {FactoryGirl.create(:village)}
  
  should have_many :patients
  should belong_to :commune
  should validate_presence_of(:nom) 
  should validate_uniqueness_of :nom
  
  should "be valid" do
    village = FactoryGirl.build(:village)
    assert_equal true, village.valid?
  end 
end
