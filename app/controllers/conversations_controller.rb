class ConversationsController < ApplicationController

  get '/convo' do
    @user = User.find_by_id(session[:user_id])
    erb :'conversations/show'
  end

  post '/convo' do
    @conversation = Conversation.create
    @user = User.create(username: params[:username])
    session[:user_id] = @user.id
    redirect to '/front'
    erb :'conversations/show'
  end

  get '/conversations/:id' do
    @user = User.find_by_id(session[:user_id])
    @conversation = Conversation.find_by_id(params[:id])
    erb :'conversations/show'
  end

end
