class User < ActiveRecord::Base
  validates_presence_of :password, :name, :email, :role
end
