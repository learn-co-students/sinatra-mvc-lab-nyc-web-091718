require_relative 'config/environment'

class App < Sinatra::Base

  get '/' do
    erb :user_input
  end

  post '/piglatinize' do
    piglatin = PigLatinizer.new
    @piglatinized_phrase = piglatin.piglatinize(params[:user_phrase])

    erb :piglatinizer
  end

end ### End of App Class
