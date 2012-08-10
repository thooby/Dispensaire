# -*- encoding : utf-8 -*-
require 'test_helper'

class ConsulTratTest < ActiveSupport::TestCase

  should belong_to :consultation
  should belong_to :traitement  
  should validate_presence_of :traitement_id
  
  should "be valid" do
    consul_trat = FactoryGirl.build(:consul_trat)
    assert_equal true, consul_trat.valid?
  end
  
  context "with traitement" do
    setup do 
      @groupe_traitement = FactoryGirl.create(:groupe_traitement)
      @traitement = FactoryGirl.create(:traitement, :groupe_traitement => @groupe_traitement)
      @consul_trat = FactoryGirl.create(:consul_trat, :traitement => @traitement)
    end

    should "return traitement name" do      
      assert_equal @consul_trat.traitement_name, @traitement.description
    end
    
    should "return groupe_traitement_id" do
      assert_equal @consul_trat.groupe_traitement_id, @groupe_traitement.id
    end  
  end  
  
end
