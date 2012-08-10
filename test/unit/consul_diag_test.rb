# -*- encoding : utf-8 -*-
require 'test_helper'

class ConsulDiagTest < ActiveSupport::TestCase

  should belong_to :consultation
  should belong_to :diagnostic
  should validate_presence_of :diagnostic_id
  
  should "be valid" do
    consul_diag = FactoryGirl.build(:consul_diag)
    assert_equal true, consul_diag.valid?
  end
  
  should "return diagnostic name" do
    diagnostic = FactoryGirl.create(:diagnostic)
    consul_diag = FactoryGirl.create(:consul_diag, :diagnostic => diagnostic)
    assert_equal consul_diag.diagnostic_name, diagnostic.description
  end  
end
