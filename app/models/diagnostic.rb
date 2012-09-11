# -*- encoding : utf-8 -*-
class Diagnostic < ActiveRecord::Base
  attr_accessible :acronime, :diag_type_id, :description
  has_many :consul_diags
  belongs_to :diag_official
  belongs_to :diag_type
  validates  :description, :diag_type_id, :presence => true
  validates  :description, :uniqueness => true
end
