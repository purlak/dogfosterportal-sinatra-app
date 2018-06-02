class UsersController < ApplicationController

  # Signup routes

  get '/signup' do 
    erb :'users/signup'      
  end 

  post '/signup' do
    username = params[:username] 
    password = params[:password]
    email = params[:email]

    @user = User.new(:username => username, :email => email, :password => password)
    if @user.save
      # create flash message for success
      redirect "/users/#{@user.id}"
    else
      # create a flash message for failure
      erb :'users/signup'
    end
  end 

  # Login routes 

  get '/login' do 
    erb :'users/login'   
  end 

  post '/login' do
    @user = User.find_by(username: params[:username])
      if @user && @user.authenticate(params[:password])
        session[:id] = @user.id
        redirect "/users/#{@user.id}"
      else
        #to add flash message
        redirect '/login'
      end
  end 

  #Logout route 

  get '/logout' do
    session.clear
    # To add flash message 
    redirect '/'
  end

  #Find User

  #get '/users/:id' do
  #  @user=User.find_by(:id => params[:id])
  #  @dog=Dog.all
  #  erb :'users/show_user_summary'
  #end 

end 