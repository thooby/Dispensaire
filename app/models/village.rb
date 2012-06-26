# -*- encoding : utf-8 -*-
class Village < ActiveRecord::Base
  attr_accessible :nom, :commune_id
  has_many :patients
  belongs_to :commune
  validates  :nom, :presence => true
  validates  :nom, :uniqueness => true
  
end
