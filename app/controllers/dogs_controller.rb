class DogsController < ApplicationController

  # Display details of all dogs 
  get '/dogs' do
    if session[:id]
      @dog= Dog.all 
      erb :'dogs/dogs'
    else 
      #to add flash messahe
      redirect '/login'
    end
  end 
  

end 