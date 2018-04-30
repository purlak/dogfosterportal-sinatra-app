class DogsController < ApplicationController

  # Display details of all dogs 
  get '/dogs' do
    if session[:id]
      @dog= Dog.all 
      erb :'dogs/dogs'
    else 
      #to add flash message
      redirect '/login'
    end
  end 


  # Create Dog / Add new dog to db

  get '/dogs/new' do 
    if session[:id]
      erb :'dogs/create_dog'
    else 
      # to add flash message 
      redirect '/login'
    end 
  end 

  # Display dog by id 

  get '/dogs/:id' do 
    if session[:id]
      @dog= Tweet.find(params[:id])
      erb :'/dogs/show_dog'
    else
      # to add flash message
      redirect "/login"
    end
  end

  

end 