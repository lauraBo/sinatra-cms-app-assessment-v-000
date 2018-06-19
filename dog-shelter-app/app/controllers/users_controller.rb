class UsersController < ApplicationController 
  
  get '/login' do
    if logged_in?
      redirect '/users/home'
    else 
    erb :'users/login'
  end
end 
  

  
  post '/login' do
   user = User.find_by(:username => params[:username])

 if user && user.authenticate(params[:password])
  session[:user_id] = user.id
  redirect '/users/home'
  else
   redirect '/'
    end
  end
  
 
  
  get '/logout' do 
    session.clear
    redirect '/'
  end

  get '/users/home' do
    if logged_in?
     @user = User.find(session[:user_id])
    erb :'/users/home'
  else 
    redirect '/login'
  end
end
  
  
  

   get '/signup' do
    if !logged_in?
      erb :'users/signup'
    else 
      redirect "/users/home"
    end 
  end 
 

post '/signup' do 
    if params[:username] == "" || params[:email] == "" || params[:password] == ""
    redirect '/signup'
  else
    @user = User.create(username: params[:username], password: params[:password], email: params[:email])
    @user.save 
    session[:user_id] = @user.id
    redirect '/users/home'
  end 
end 


end 

