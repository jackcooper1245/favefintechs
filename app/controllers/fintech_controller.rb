class FintechController < ApplicationController

    get '/fintechs' do
        @fintechs = Fintech.all
        @reviews = Review.all
        if logged_in?
        erb :'/fintechs/index'
        else
          erb :login
        end
      end

    get '/fintechs/new' do
        @fintechs = Fintech.all
        erb :'/fintechs/new'
    end  

    get '/fintechs/:id' do
        @reviews = Review.all
        @fintech = Fintech.find(params[:id])
        erb :'/fintechs/show'
    end


    post '/fintechs/new' do
        @fintech = Fintech.create(name: params[:fintechname], user_id: current_user.id, founded: params[:founded], sector: params[:sector], founders: params[:founders], url: params[:url])
        redirect to '/fintechs'
    end   
    
    
    delete '/fintechs/:id' do #delete action
        @fintech = Fintech.find(params[:id])
        @fintech.delete
        redirect to '/fintechs'
    end


    get '/fintechs/:id/edit' do 
        @fintech = Fintech.find(params[:id])
        erb :'/fintechs/edit'         
    end  

    patch '/fintechs/:id' do #edit action
        @fintech = Fintech.find(params[:id])
        @fintech.name = params[:fintechname]
        @fintech.founded = params[:founded]
        @fintech.sector = params[:sector]
        @fintech.save
        redirect to "/fintechs/#{@fintech.id}"
      end


    
end