require './config/environment'

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
    user = User.new(name: params[:name], username: params[:username], emails: params[:email], password: params[:pswd])
    if (user.save) && (params[:username].length > 0) && (params[:email].length > 0)
	  session[:user_id] = user.id
			redirect "/fintechs"
		else
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
      redirect "/fintechs"
	else
		redirect "/"
		end	
	end


	helpers do
		def logged_in?
			!!session[:user_id]
		end

	  def current_user
			User.find(session[:user_id])
    end
  end
  

end
