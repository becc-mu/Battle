require 'sinatra/base'
# redirect '/route' will issue an 'internal GET request' within the server. Check your server logs when you submit the form: you'll see a POST request with the form params, followed by a GET request (the redirect). That internal GET request will activate the get '/play' action, which will render the play.erb view.
class Battle < Sinatra::Base
  # Let's enable the session so we can store information between requests.
  enable :sessions

  get '/' do
    erb :index
    # 'Testing infrastructure working!'
  end

  # Point the index.erb form action to a post '/names' route
  # In the post '/names' route, let's store the player names in the session instead of assigning them to instance variables:
  post '/names' do
    session[:player_1_name] = params[:player_1_name]
    session[:player_2_name] = params[:player_2_name]
    redirect '/play'
  end

  get '/play' do
    @player_1_name = session[:player_1_name]
    @player_2_name = session[:player_2_name]
    erb :play
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
