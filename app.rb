require_relative 'config/environment'

class App < Sinatra::Base

  get '/' do
    erb :user_input
  end

  post '/piglatinize' do
    pg = PigLatinizer.new
    @start = pg.piglatinize(params[:user_phrase])
    "#{@start}"
  end
end
