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
  
  get '/sessions/logout' do 
    session.clear
    redirect '/'
  end

  get '/users/home' do
    @user = User.find(session[:id])   # FINDS THE CURRENT USER BASED ON THE ID VALUE FROM SESSIONS HASH,     SETS AN INSTANCE VARIABLE TO ACCESS THE CURRENT USER IN THE VIEW PAGE 

    erb :'/users/home'
  end

   get '/signup' do
    if !logged_in?
      erb :'users/signup'
    else 
      redirect '/users/home'
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

