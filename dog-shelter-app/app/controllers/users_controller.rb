class UsersController < ApplicationController 
  
  get '/sessions/login' do
    erb :'sessions/login'
  end
  
  
  post '/sessions' do
   user = User.find_by(:username => params[:username])

 if user && user.authenticate(params[:password])
  session[:user_id] = user.id
  redirect '/users/home'
  else
   redirect “/“
    end
  end
end 

