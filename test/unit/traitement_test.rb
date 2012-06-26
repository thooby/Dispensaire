# -*- encoding : utf-8 -*-
require 'test_helper'

class TraitementTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Traitement.new(:description => "Aspirine", :groupe_traitement_id => 1).valid?
  end
  should have_many :consul_trats
  should belong_to :groupe_traitement 
  should validate_presence_of :description
  should validate_presence_of :groupe_traitement_id
  should validate_uniqueness_of :description 
  
end
