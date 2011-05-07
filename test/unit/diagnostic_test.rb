require 'test_helper'

class DiagnosticTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Diagnostic.new.valid?
  end
  should_have_many :consul_diags
end
