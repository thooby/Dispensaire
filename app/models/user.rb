# -*- encoding : utf-8 -*-
class User < ActiveRecord::Base
acts_as_authentic
def is?(r)
    role.to_s==r.to_s
  end
end
