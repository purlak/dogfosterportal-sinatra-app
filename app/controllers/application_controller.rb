require './config/environment'

class ApplicationController < Sinatra::Base
  

  configure do
    set :public_folder, 'public'
    enable :sessions
    set :session_secret, "my_application_secret"
    set :views, 'app/views'    
  end

  get '/' do
    if session[:user_id]
      redirect "users/#{session[:user_id]}"
    else
      # to add flash message  
      erb :index
    end 
  end

end
