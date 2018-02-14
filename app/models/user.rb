class User < ActiveRecord::Base
  has_many :messages
  has_many :conversations through: :messages
end
