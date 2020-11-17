require_relative 'config/environment'
require_relative 'models/piglatinizer'
require 'pry'

class App < Sinatra::Base

    get '/' do
        erb :user_input
    end

    post '/piglatinize' do
        latin = PigLatinizer.new
        @latinized = latin.piglatinize(params[:user_phrase])
        erb :piglatinize
    end

end