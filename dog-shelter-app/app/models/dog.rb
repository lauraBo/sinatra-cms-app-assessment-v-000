class Dog < ActiveRecord::Base
  
  belongs_to :user 
  validates_presence_of :user_id, :name, :age, :breed, :shelter 
end 

  