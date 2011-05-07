require 'test_helper'

class ConsulTratTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert ConsulTrat.new.valid?
  end
  should_belong_to :consultation
  should_belong_to :traitement  
end
