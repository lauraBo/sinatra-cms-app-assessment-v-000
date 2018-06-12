class DogsController < ApplicationController
  
  
  get '/dogs/new' do
 erb :'/dogs/new'
end 
  
  
  post '/dogs' do
  @dog = Dog.create(:name => params[:name], :breed => params[:breed], :shelter => params[:shelter], :age => params[:age] )
  redirect to '/dogs/#{@dog.id}'
 end

get '/dogs' do
  @dogs = Dog.all
  erb  :'/dogs/index' 
end


get '/dogs/:id' do
@dog = Dog.find_by_id(params[:id])
erb :'dogs/show'
end

get '/dogs/:id/edit' do  #load edit form
 @dog = Dog.find_by_id(params[:id])
 erb :'dogs/edit'
end

end