# -*- encoding : utf-8 -*-
require 'test_helper'

class GroupeTraitementTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert GroupeTraitement.new(:description => "Antiviral").valid?
  end
  should have_many :traitements 
  should validate_presence_of :description
   
end
