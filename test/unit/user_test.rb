<<<<<<< HEAD
require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
=======
# -*- encoding : utf-8 -*-
require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert User.new.valid?
>>>>>>> master
  end
end
