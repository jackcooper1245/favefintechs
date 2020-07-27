require './config/environment'
require 'sinatra/flash'

class ApplicationController < Sinatra::Base

	configure do
		set :public_folder, 'public'
		set :views, 'app/views'
		enable :sessions
		set :session_secret, "password_security"  
		register Sinatra::Flash
	end

	get "/" do
		if logged_in?
			redirect '/fintechs'
		else
		@user = User.all
		erb :index
		end
	end

	get '/fintechs' do
		if logged_in?
		erb :'/fintechs/index'
		else
		erb :login
		end
	end

	get "/signup" do
	if logged_in?
		redirect "/fintechs"
	else
		erb :signup
	end    
	end

	post "/signup" do
	user = User.new(name: params[:name], username: params[:username], email: params[:email], password: params[:pswd])
		if (user.save) && (params[:username].length > 0) && (params[:email].length > 0)
		session[:user_id] = user.id
		redirect "/fintechs"
		else
		flash[:warning] = "Looks like that Username is already taken"
		redirect "/signup"
	end
	end

	get "/login" do
		if logged_in?
		redirect "/fintechs"
		else
		erb :login
		end   
	end

	post "/login" do
		user = User.find_by(:username => params[:username])
		if user && user.authenticate(params[:pswd])
		session[:user_id] = user.id
		flash[:warning] = "Successfully logged in as #{current_user.username}"
		redirect "/fintechs"		
		else
		flash[:warning] = "Your details were incorrect. Please try again"
		redirect "/login"
		end	
	end


	post "/search" do
		@fintechs = Fintech.all
		if
		@fintech = @fintechs.find_by(name: params[:search])
		redirect to "/fintechs/#{@fintech.id}"
		else
			redirect to '/error'
		end
	end

	get '/error' do
		erb :error
	end

	helpers do
		def logged_in?
			!!session[:user_id]
		end

		def current_user
			User.find(session[:user_id])
		end
	end
	
	get '/test' do
		erb :'/fintechs/test'
	end
	
end
