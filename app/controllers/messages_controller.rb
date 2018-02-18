class MessagesController < ApplicationController
  post '/convo' do
    @message = Message.create(:name => params["Name"])
    @message.owner = User.find_or_create_by(:name => params["Artist Name"])
    @message.receiver = User.find_or_create_by(:name => params["Artist Name"])
    @message.save
  end
end
