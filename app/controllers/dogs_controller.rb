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


  # Create Dog 

  get '/dogs/new' do 
    if session[:id]
      erb :'dogs/create_dog'
    else 
      # to add flash message 
      redirect '/login'
    end 
  end 
  

end 