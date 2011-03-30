class Village < ActiveRecord::Base
  attr_accessible :nom, :commune_id
  has_many :patients
end
