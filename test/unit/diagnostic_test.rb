# -*- encoding : utf-8 -*-
require 'test_helper'

class DiagnosticTest < ActiveSupport::TestCase
  subject {FactoryGirl.create(:diagnostic)}
  
  should have_many :consul_diags
  should validate_presence_of :description
  should validate_uniqueness_of :description
  
  should "be valid" do
    diagnostic = FactoryGirl.build(:diagnostic)
    assert_equal true, diagnostic.valid?
  end
end
