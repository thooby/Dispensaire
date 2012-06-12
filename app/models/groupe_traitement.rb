class GroupeTraitement < ActiveRecord::Base
  attr_accessible :description
  has_many :traitements
end
