class MessagesController < ApplicationController
  # post '/convo' do
  #   @message = Message.create(:name => params["Name"])
  #   @message.owner = User.find_or_create_by(:name => params["Artist Name"])
  #   @message.receiver = User.find_or_create_by(:name => params["Artist Name"])
  #   @message.save
  # end

  get '/messages' do
    @user = User.find_by_id(session[:user_id])
    @messages = Message.all
    erb :'messages/messages'
  end

  post '/messages' do
    @message = Message.create(message: params[:message], user_id: session[:user_id], receiver_id: params[:receiver_id])
  end


  # post '/convo' do
  #   @user = User.create(username: params[:username])
  #   session[:user_id] = @user.id
  #   redirect to '/front'
  #   erb :'conversations/show'
  # end

  get '/conversations/:id' do
    @user = User.find_by_id(session[:user_id])
    @conversation = Conversation.find_by_id(params[:id])
    erb :'conversations/show'
  end

end
