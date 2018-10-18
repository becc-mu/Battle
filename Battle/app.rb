require 'sinatra/base'
require './lib/game'
require './lib/player'
# redirect '/route' will issue an 'internal GET request' within the server. Check your server logs when you submit the form: you'll see a POST request with the form params, followed by a GET request (the redirect). That internal GET request will activate the get '/play' action, which will render the play.erb view.
class Battle < Sinatra::Base
  # Let's enable the session so we can store information between requests.
  enable :sessions

  # get '/' do
  #   erb :index
  #   # 'Testing infrastructure working!'
  # end

  # Point the index.erb form action to a post '/names' route
  # In the post '/names' route, let's store the player names in the session instead of assigning them to instance variables:
  post '/names' do
    player_1 = Player.new(params[:player_1_name])
    player_2 = Player.new(params[:player_2_name])
    @game = Game.new(player_1, player_2)
    redirect '/play'
  end

  get '/play' do
    @game = $game
    erb :play
  end

  get '/attack' do
    @game = $game
    @game.attack(@game.player_2)
    erb :attack
  end
