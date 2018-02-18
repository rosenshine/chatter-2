require 'pry'
class UsersController < ApplicationController

  get '/signup' do
    if !logged_in?
      erb :'users/signup'
    else
      redirect '/recipients'
    end
  end

  post '/signup' do
    @user = User.create(username: params[:username])
    session[:user_id] = @user.id
    redirect to '/recipients'
  end

  get '/recipients' do
    @user = User.find_by(id: session[:user_id])
    @users = User.all
    erb :'users/index'
  end

  post '/recipients' do
    @user = User.find_by(id: session[:user_id])
    @receiver = User.find_by_id(params[:receiver_id])
    @messages = Message.all
    @users = User.all
    erb :'messages/messages'
  end

  get '/login' do
    if !logged_in?
      erb :'users/login'
    else
      redirect '/recipients'
    end
  end

  post '/login' do
    @user = User.find_by(username: params[:username])
    if @user
      session[:user_id] = @user.id
      redirect '/recipients'
    else
      redirect '/signup'
    end
  end

  get '/logout' do
    if !logged_in?
      redirect '/login'
    else
      session.clear
      redirect '/login'
    end
  end

end
