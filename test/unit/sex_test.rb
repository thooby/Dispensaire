require 'test_helper'

class SexTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Sex.new(:description => "Feminin").valid?
  end
  should have_many :patients
  should validate_presence_of :description
  
end
