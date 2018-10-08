require_relative 'config/environment'

class App < Sinatra::Base

  get '/' do
    erb :user_input
  end

  post '/piglatinize' do
    p = PigLatinizer.new
    @piggy_text = p.piglatinize(params[:user_phrase])
    "#{@piggy_text}"
  end
end
