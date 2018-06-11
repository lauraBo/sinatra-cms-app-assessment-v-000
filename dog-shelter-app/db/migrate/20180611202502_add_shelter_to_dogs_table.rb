class AddShelterToDogsTable < ActiveRecord::Migration
  def change
    add_column(:dogs, :shelter, :string )
  end
end
