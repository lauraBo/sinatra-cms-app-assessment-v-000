class User < ActiveRecord::Base
            
  has_many :dogs
  has_secure_password
   validates_presence_of :username, :email
end 
