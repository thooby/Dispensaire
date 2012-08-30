# -*- encoding : utf-8 -*-
require 'test_helper'

class MotifTest < ActiveSupport::TestCase
  subject {FactoryGirl.create(:motif)}
  
  should have_many :consul_motifs
  should validate_presence_of :description
  should validate_uniqueness_of :description
  
  should "be valid" do
    motif = FactoryGirl.build(:motif)
    assert_equal true, motif.valid?
  end
end
