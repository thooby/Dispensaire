# -*- encoding : utf-8 -*-
require 'test_helper'

class TipeconsultationTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Tipeconsultation.new(:tipe => "NC").valid?
  end
  should have_many :consultations  
  should validate_presence_of :tipe
  
end
