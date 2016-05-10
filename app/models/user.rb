class User < ActiveRecord::Base
  belongs_to :role

  validates_presence_of :password, :name, :email, :role
end
