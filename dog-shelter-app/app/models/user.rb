class User < ActiveRecord::Base
            
  has_many :dogs
  has_secure_password
  
end 
