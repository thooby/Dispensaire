# -*- encoding : utf-8 -*-
require 'test_helper'

class ProfessionTest < ActiveSupport::TestCase
  subject {FactoryGirl.create(:profession)}
  
  should have_many :patients
  should validate_presence_of :nom
  should validate_uniqueness_of :nom
  
  should "be valid" do
    profession = FactoryGirl.build(:profession)
    assert_equal true, profession.valid?
  end
  
end
