# -*- encoding : utf-8 -*-
class Diagnostic < ActiveRecord::Base
  attr_accessible :acronime, :description
  has_many :consul_diags
  belongs_to :diag_official
  validates  :description, :presence => true
  validates  :description, :uniqueness => true
end
