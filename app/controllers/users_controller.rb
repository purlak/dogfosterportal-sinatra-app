class UsersController < ApplicationController

  get '/signup' do 
    if session[:user_id]
      redirect 'dogs/dogs'
    else 
      erb :index  
    end  
  end 



end 