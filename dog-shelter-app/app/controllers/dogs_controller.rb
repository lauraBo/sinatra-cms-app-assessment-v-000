class DogsController < ApplicationController
  
  
  get '/dogs/new' do
    if logged_in?
 erb :'/dogs/new'
 else 
   flash[:message] = "You need to log in to your account to view this page."
   redirect '/login'
end 
end  

 
 post '/dogs' do 
      if !params[:name].empty? && !params[:breed].empty? && !params[:age].empty? && !params[:shelter].empty?
    @user = User.find_by_id(session[:user_id])
    @dog = Dog.create(name: params[:name], breed: params[:breed], shelter: params[:shelter], age: params[:age], :user_id => @user.id)
    @dog.save 
    flash[:message] = "Successfully added new dog!"
    erb  :'/users/home'
  else 
    flash[:message] = "Invalid. Please try again."
    redirect 'dogs/new'
  end 
end 



get '/dogs' do
  @dogs = Dog.all
  erb  :'/dogs/index' 
end


get '/dogs/:id' do
  if logged_in?
  @dog = Dog.find_by_id(params[:id])
  erb :'dogs/show'
else
   flash[:message] = "You need to log in to view this page."
  redirect '/login'
end
end 

get '/dogs/:id/edit' do  #load edit form

  @dog = Dog.find_by_id(params[:id])
  if @dog.user_id == current_user.id
  erb :'dogs/edit'
else 
   flash[:message] = "You do not have permission to edit this listing."
  redirect '/login'
 end
end 



delete '/dogs/:id/delete' do
  
    @dog = Dog.find_by_id(params[:id])
    if @dog.user_id == current_user.id
    @dog.destroy 
    redirect  '/users/home'
  else 
     flash[:message] = "You do not have permission to delete this listing."
    redirect  '/users/home'
  end 
end 





patch '/dogs/:id' do 
  
  @dog = Dog.find_by_id(params[:id])
  if !params[:name].empty? && !params[:breed].empty? && !params[:age].empty? && !params[:shelter].empty?
  @dog.name = params[:name]
  @dog.breed = params[:breed]
  @dog.age = params[:age]
  @dog.shelter = params[:shelter]
  @dog.save
  redirect "/dogs/#{@dog.id}"
else
    flash[:message] = "Invalid. Please try again."
    redirect "/dogs/#{@dog.id}/edit"
  end 
end 



end