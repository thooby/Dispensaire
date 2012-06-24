require 'test_helper'

class DiagnosticTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Diagnostic.new(:description => "Palu").valid?
  end
  should have_many :consul_diags
  should validate_presence_of :description
  should validate_uniqueness_of :description
end
