# -*- encoding : utf-8 -*-
class User < ActiveRecord::Base
  acts_as_authentic
  ROLES = %w[sanitaire local_admin visiteur admin chercheur defendu]
  ROLES2 = %w[sanitaire local_admin visiteur]
end
