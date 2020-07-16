class ReviewController < ApplicationController


get '/reviews' do
    @reviews = Review.all
    erb :'/reviews/index'
end  

get '/reviews/new' do
    @fintechs = Fintech.all
    erb :'/reviews/new'
end

get '/reviews/:id' do
    @review = Review.find(params[:id])
    erb :'/reviews/show'
end


post '/reviews/new' do
    puts params
    @review = Review.create
    @review.company_name = params[:reviewed_company]
    @review.content = params[:content]  
    @review.user_id = current_user.id
    @review.rating = params[:rating]
    @fintech = Fintech.find_by(name: params[:reviewed_company])
    @review.fintech_id = @fintech.id
    @review.save
    redirect '/reviews'
end   


delete '/reviews/:id' do #delete action
    @review = Review.find(params[:id])
    @review.delete
    redirect to '/reviews'
end


get '/reviews/:id/edit' do 
    @fintechs = Fintech.all
    @review = Review.find(params[:id])
    erb :"/reviews/edit"        
end  

patch '/reviews/:id' do #edit action
    @review = Fintech.find(params[:id])
    @review.content = params[:content]
    @review.save
    redirect to "/reviews/#{@review.id}"
  end

end