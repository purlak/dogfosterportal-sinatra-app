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



end 