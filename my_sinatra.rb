require 'sinatra'

require 'sequel'
require 'sequel/extensions/seed'
require 'pg'
require 'json'
require 'multi_json'

# 2-nd stage namespace
require 'sinatra/namespace'

# 3 stage - module run
require 'sinatra/base'

%w(controllers models routes).each {|dir| Dir.glob("./#{dir}/*.rb", &method(:require))}

DB = Sequel.connect(
    adapter: :postgres,
    database: 'sinatra_development',
    host: 'localhost',
    password: 'password',
    user: 'vikkoro',
    max_connections: 10,
# logger: Logger.new('log/db.log')
)


# module MyAppModule  # 3 stage - module run
#   class App < Sinatra::Base  # 3 stage - module run
#     register Sinatra::Namespace   # 3 stage - module run

    # 1 main style
    get '/' do # Outside namespace
      'Hello My my_sinatra - Easy and Wide world!'
    end

    # 4 stage Routes - redirect
    # get '/' do
    #   "This route is fired"
    #   redirect to('/hello/World')
    # end

    get %r{/hello/([\w]+)} do |c|
      "Hello, #{c}!"
    end

    # 2 params
    get "/hello/:name" do # Outside namespace
      # соответствует "GET /hello/foo" и "GET /hello/bar",
      # где params['name'] 'foo' или 'bar'
      "my_sinatra приветствует тебя, #{params[:name]}!"
    end

    get '/say/*/to/*' do
      params['splat'].to_s # => ["hello", 'world']
    end

    get '/jobs.?:format?' do
      "Да, работает этот маршрут"
    end

    namespace '/api/v1' do # Inside namespace 2-nd stage namespace
      get "/*" do
        "I don't know what is the #{params[:splat]}. It's what you typed."
      end
    end

#   end  # 3 stage - module run
# end  # 3 stage - module run



