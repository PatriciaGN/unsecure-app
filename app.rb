require 'sinatra/base'
require "sinatra/reloader"

class Application < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    return erb(:index)
  end

  post '/hello' do
    @name = params[:name]
    if @name.match?(/^[\w\-\s]+$/)
      return erb(:hello)
    else
      status 400
    end
  end
end
