require_relative 'config/environment'

class App < Sinatra::Base

  get '/' do
    erb :user_input
  end

  post '/piglatinize' do
    @pigify_text = PigLatinizer.new(params[:phrase])
    erb :piglatinized
  end
end
