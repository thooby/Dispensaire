# -*- encoding : utf-8 -*-
require 'test_helper'

class EthnieTest < ActiveSupport::TestCase
  subject {FactoryGirl.create(:ethnie)}
  
  should have_many :patients  
  should validate_presence_of :nom
  should validate_uniqueness_of :nom
  
  should "be valid" do
    ethnie = FactoryGirl.build(:ethnie)
    assert_equal true, ethnie.valid?
  end
  
end
