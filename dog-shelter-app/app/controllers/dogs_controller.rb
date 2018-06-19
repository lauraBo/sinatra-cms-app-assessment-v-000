class DogsController < ApplicationController
  
  
  get '/dogs/new' do
    if logged_in?
 erb :'/dogs/new'
 else 
   redirect '/login'
end 
end  

 
 post '/dogs' do 
   if !params.empty?
    @user = User.find_by_id(session[:user_id])
    @dog = Dog.create(name: params[:name], breed: params[:breed], shelter: params[:shelter], age: params[:age], :user_id => @user.id)
    @dog.save 
    erb  :'/users/home'
  else 
    redirect 'dogs/new'
  end 
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
  if logged_in?
  @dog = Dog.find_by_id(params[:id])
  erb :'dogs/edit'
else 
  redirect '/login'
 end
end 



patch '/dogs/:id' do #edit action
  
  @dog = Dog.find_by_id(params[:id])
  if @dog.user_id == current_user.id
  @dog.name = params[:name]
  @dog.breed = params[:breed]
  @dog.age = params[:age]
  @dog.shelter = params[:shelter]
  @dog.save
  redirect  "/dogs/#{@dog.id}"
else
    redirect "/login"
  end 
end 



delete '/dogs/:id/delete' do
  
    @dog = Dog.find_by_id(params[:id])
    if @dog.user_id == current_user.id
    @dog.destroy 
    redirect '/dogs'
  else
    redirect  '/users/home'
  end 
end 



end