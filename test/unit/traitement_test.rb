require 'test_helper'

class TraitementTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Traitement.new.valid?
  end
  should_have_many :consul_trats
  should_belong_to :groupe_traitement  
end
