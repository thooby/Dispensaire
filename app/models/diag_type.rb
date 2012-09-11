class DiagType < ActiveRecord::Base
  has_many :diagnostics
  attr_accessible :description
  validates  :description, :presence => true, :uniqueness => true
end
