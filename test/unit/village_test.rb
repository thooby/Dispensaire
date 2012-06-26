# -*- encoding : utf-8 -*-
require 'test_helper'

class VillageTest < ActiveSupport::TestCase
  should validate_presence_of(:nom) 
  should validate_uniqueness_of :nom
  
  def test_should_be_valid
    assert Village.new(:nom => "Beleko").valid?
  end 
  should have_many :patients
  should belong_to :commune
end
