class DogsController < ApplicationController
  
  
  get '/dogs/new' do
 erb :'/dogs/new'
end 
  
  
  post '/dogs' do
  @dog = Dog.create(:name => params[:name], :breed => params[:breed], :shelter => params[:shelter], :age => params[:age] )
  redirect to '/dogs/#{@dog.id}'
 end

end