# -*- encoding : utf-8 -*-
class GroupeTraitement < ActiveRecord::Base
  attr_accessible :description
  has_many :traitements
  validates  :description, :presence => true, :uniqueness => true
  
end
