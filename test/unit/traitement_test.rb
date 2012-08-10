# -*- encoding : utf-8 -*-
require 'test_helper'

class TraitementTest < ActiveSupport::TestCase
  subject {FactoryGirl.create(:traitement)}
  
  should have_many :consul_trats
  should belong_to :groupe_traitement 
  should validate_presence_of :description
  should validate_presence_of :groupe_traitement_id
  should validate_uniqueness_of :description 
  
  should "be valid" do
    traitement = FactoryGirl.build(:traitement)
    assert_equal true, traitement.valid?
  end
  
end
