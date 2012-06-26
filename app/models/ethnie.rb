# -*- encoding : utf-8 -*-
class Ethnie < ActiveRecord::Base
  attr_accessible :nom
  has_many :patients
  validates  :nom, :presence => true
  validates  :nom, :uniqueness => true
end
