require 'test_helper'

class ConsulTratTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert ConsulTrat.new(:traitement_id => 1, :consultation_id => 1).valid?
  end
  should belong_to :consultation
  should belong_to :traitement  
  should validate_presence_of :consultation_id
  should validate_presence_of :traitement_id
end
