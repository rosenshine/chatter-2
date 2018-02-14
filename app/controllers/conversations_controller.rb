class ConversationsController < ApplicationController

  get '/show' do
    erb :'conversations/show'
  end

end
