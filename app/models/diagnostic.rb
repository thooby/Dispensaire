class Diagnostic < ActiveRecord::Base
  attr_accessible :acronime, :description
  has_many :consul_diags
end
