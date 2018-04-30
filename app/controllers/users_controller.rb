class UsersController < ApplicationController

  get '/signup' do 
    if session[:user_id]
      redirect 'tweets/tweets'
    else 
      erb :index  
    end  
  end 

  

end 