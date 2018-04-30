class UsersController < ApplicationController

  get '/signup' do 
    if session[:user_id]
      redirect 'users/show_user_summary'
    else 
      erb :signup  
    end  
  end 



end 