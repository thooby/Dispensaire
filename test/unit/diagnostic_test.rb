require 'test_helper'

class DiagnosticTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Diagnostic.new.valid?
  end
end
