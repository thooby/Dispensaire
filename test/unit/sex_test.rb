# -*- encoding : utf-8 -*-
require 'test_helper'

class SexTest < ActiveSupport::TestCase

  should have_many :patients
  should validate_presence_of :description
  
  should "be_valid" do
    sex = FactoryGirl.build(:sex)
    assert_equal true, sex.valid?
  end
end
