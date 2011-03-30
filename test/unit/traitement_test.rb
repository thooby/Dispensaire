require 'test_helper'

class TraitementTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Traitement.new.valid?
  end
end
