class App < Sinatra::Base

  get '/' do
    erb :user_input
  end

  post '/piglatinize' do
    # piglatinize
    input = params[:user_phrase]
    instance = PigLatinizer.new
    @piglatin = instance.piglatinize(input)
    erb :results
  end

  # post '/piglatinize'

end
