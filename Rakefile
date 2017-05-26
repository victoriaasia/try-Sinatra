require 'sinatra'
require './lib/tasks/db'

namespace :db do
  task :environment do
    require 'sequel'
    ENV['DATABASE_URL'] ||= 'postgres://sinatra_admin:password@localhost/sinatra_development'
    ENV['RACK_ENV'] ||= 'development'
    ENV['DATABASE'] = 'sinatra_development' if ENV['RACK_ENV'] == 'development'
    ENV['DATABASE'] = 'sinatra_test' if ENV['RACK_ENV'] == 'test'
    ENV['DATABASE'] = 'sinatra_production' if ENV['RACK_ENV'] == 'production'
  end
end