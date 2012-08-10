# -*- encoding : utf-8 -*-
require 'test_helper'

class TipeconsultationTest < ActiveSupport::TestCase

  should have_many :consultations  
  should validate_presence_of :tipe

  should "be_valid" do
    tc = FactoryGirl.build(:tipeconsultation)
    assert_equal true, tc.valid?
  end
end
