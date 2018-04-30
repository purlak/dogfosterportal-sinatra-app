class UsersController < ApplicationController

  # Signup 

  get '/signup' do 
    if session[:user_id]
      redirect 'users/show_user_summary'
    else 
      erb :signup  
    end  
  end 

  post '/signup' do
    @username = params[:username] 
    @password = params[:password]
    @email = params[:email]
    
    if @username == "" || @password == "" || @email == "" 
      # to add flash message 
      redirect '/signup'
    else  
      # to add flash message 
      session[:user_id] = 1
      redirect 'users/show_user_summary'
    end 
  end 

  # Login

  get '/login' do  
    if session[:id]
      redirect '/show_user_summary'
    else
      # to add flash message  
      erb :'users/login'
    end 
  end 

  post '/login' do
    @user = User.find_by(username: params[:username])
      if @user #&& @user.authenticate(params[:password])
        session[:id] = @user.id
        redirect '/show_user_summary'
      else
        redirect '/login'
      end
  end 

  #Logout

  get '/logout' do
    session.clear
    # To add flash message 
    redirect '/login'
  end

  #Find User

  get '/users/:slug' do
    @user=User.find_by_slug(params[:slug])
    @dog=Dog.all

    erb :'users/show_user_summary'
  end 

end 