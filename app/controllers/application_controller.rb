require './config/environment'
require 'sinatra'
require 'sinatra-websocket'
require 'pry'

set :server, 'thin'
set :sockets, []

class ApplicationController < Sinatra::Base

  use Rack::Session::Cookie, :key => 'rack.session',
  :path => '/',
  :secret => 'your_secret'
  set :views, 'app/views'
  set :server, 'thin'
  set :sockets, []

  get '/' do

    @messages = Message.all.reverse

    if !request.websocket?
      erb :index
    else
      request.websocket do |ws|
        ws.onopen do
          settings.sockets << ws
        end
        ws.onmessage do |msg|
          EM.next_tick { settings.sockets.each{|s| s.send(msg) } }
        end
        ws.onclose do
          warn("websocket closed")
          settings.sockets.delete(ws)
        end
      end
    end
  end

  post '/' do
    @message = Message.create(input: params[:input])
  end
end
