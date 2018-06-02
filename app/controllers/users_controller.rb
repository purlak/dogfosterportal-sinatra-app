class UsersController < ApplicationController

  # Signup 

  get '/signup' do 
    erb :'users/signup'      
  end 

  post '/signup' do
    username = params[:username] 
    password = params[:password]
    email = params[:email]

    # make a @user with this info ^^
    @user = User.new(:username => username, :email => email, :password => password)
    if @user.save
      # create flash message for success
      redirect "/users/#{@user.id}"
    else
      # create a flash message for failure
       erb :'users/signup'
    end
    
    #binding.pry
    #if username == "" || password == "" || email == "" 
      # to add flash message 
    #  redirect '/signup'
    #else  
      # to add flash message 
      #session[:id] = 1
    #  redirect "/users/#{@user.id}"
    #end 
  end 

  # Login

  get '/login' do 
    #binding.pry 
    #if session[:id]
    #  redirect 'users/show_user_summary'
    #else
      # to add flash message 
      binding.pry 
      erb :'users/login'
    #end 
  end 

  post '/login' do
    @user = User.find_by(username: params[:username])
      #binding.pry
      if @user && @user.authenticate(params[:password])
        session[:id] = @user.id
        #binding.pry
        redirect "/users/#{@user.id}"
      else
        #to add flash message
        redirect '/login'
      end
  end 

  #Logout

  get '/logout' do
    session.clear
    # To add flash message 
    redirect '/'
  end

  #Find User

  get '/users/:id' do
    @user=User.find_by(:id => params[:id])
    @dog=Dog.all
    erb :'users/show_user_summary'
  end 

end 