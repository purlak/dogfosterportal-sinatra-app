require 'rack-flash'

#Dogs Controller 

class DogsController < ApplicationController
  use Rack::Flash

  # Display details of all dogs in db
  get '/dogs' do
    @dogs= Dog.all 
    erb :'dogs/dogs'
  end 

  # Create Dog / Add new dog to db
  get "/dogs/new" do 
    if logged_in?   
      erb :'dogs/create_dog'
    else 
      redirect "/dogs"
    end 
  end 

  post '/dogs' do
    if logged_in?
      if params[:dog_name] != ""   
        @dog = Dog.create(dog_name: params[:dog_name], age: params[:age], breed: params[:breed], adoption_status: params[:adoption_status])
        @user=current_user
        @dog.user_id = session[:user_id]
        @dog.save
        flash[:message] = "Success. Added dog to database." 
        redirect '/dogs'
      else
        flash[:message] = "Error. Try again." 
        redirect '/dogs/new'
      end     
    else
      redirect '/login'
    end
  end
  
  # Edit/Update dog details / check for user id match 

  get '/dogs/:id/edit' do
    if logged_in?
      @dog= Dog.find_by(:id => params[:id])
      @user=current_user
         
        if @dog.user_id == @user.id
           
          erb :'/dogs/edit_dog'
        else      
          flash[:message] = "Error. The user id does not match. Only the creator of the entry can edit this entry."
          redirect "/dogs/#{@dog.id}"
        end 
    else
      redirect "/login"
    end
  end

  patch '/dogs/:id' do
    if logged_in?   
      @dog= Dog.find_by(:id => params[:id])
      @user=current_user
      

      if params[:dog_name] != ""  
        @dog.update(dog_name: params[:dog_name])
      end 

      if params[:age] != ""  
        @dog.update(age: params[:age])
      end 

      if params[:breed] != ""  
        @dog.update(breed: params[:breed])
      end 

      if params[:adoption_status] != ""  
        @dog.update(adoption_status: params[:adoption_status])
      end 
      redirect "/dogs/#{@dog.id}"
    else
      redirect '/login'
    end
  end

  #Delete dog route 

  delete '/dogs/:id/delete' do
   
    if logged_in?
      
      if Dog.find(params[:id])
        @dog = Dog.find(params[:id])
        @user=current_user
        if @dog.user_id == @user.id
            @dog.delete
            flash[:message] = "Delete successful!"
            redirect '/dogs'
        else 
          flash[:message] = "Error. The user id does not match. Only the creator of the entry can delete this entry."
          redirect "/dogs/#{@dog.id}"
        end 
        
      end
    
    else
      redirect '/login'
    end
  end  

  # Find dog by id 

  get '/dogs/:id' do
    #binding.pry 
    if logged_in?
     @dog= Dog.find_by(:id => params[:id])
      @user=current_user
      erb :'/dogs/show_dog'
    else
      redirect "/login"
    end
  end

  #helper methods 
  helpers do
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      User.find_by(:id => session[:user_id])
    end
  end

end 