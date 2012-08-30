# -*- encoding : utf-8 -*-
require 'test_helper'

class ConsulMotifTest < ActiveSupport::TestCase

  should belong_to :consultation
  should belong_to :motif
  should validate_presence_of :motif_id

  should "be valid" do
    consul_motif = FactoryGirl.build(:consul_motif)
    assert_equal true, consul_motif.valid?
  end

  should "return motif name" do
    motif = FactoryGirl.create(:motif)
    consul_motif = FactoryGirl.create(:consul_motif, :motif => motif)
    assert_equal consul_motif.motif_name, motif.description
  end
end
