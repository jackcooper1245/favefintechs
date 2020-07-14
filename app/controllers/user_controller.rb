class UserController < ApplicationController

    get "/logout" do
     if logged_in?
        session.clear
        redirect "/"      
     else
        redirect "/"
     end  
    end
    
    get '/:id' do
        @fintechs = Fintech.all
        current_user.id = params[:id]
        erb :'/users/show'
    end

    get '/:id/edit' do 
        erb :'/users/edit'         
    end  

    delete '/:id' do
        @user = current_user
        @user.delete
        redirect '/logout'
    end

    patch '/:id' do #edit action
        @user = current_user
        @user.name = params[:name]
        @user.username = params[:username]
        @user.email = params[:email]
        @user.password = params[:password]
        @user.save
        redirect to "/#{current_user.id}"
      end

end