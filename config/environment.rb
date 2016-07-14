# Hace require de los gems necesarios.
# Revisa: http://gembundler.com/bundler_setup.html
#      http://stackoverflow.com/questions/7243486/why-do-you-need-require-bundler-setup
ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)

require 'bundler/setup' if File.exists?(ENV['BUNDLE_GEMFILE'])

# Require gems we care about
require 'rubygems'

require 'uri'
require 'pathname'

require 'pg'
require 'active_record'
require 'logger'

require 'sinatra'
require "sinatra/reloader" if development?

require 'erb'

require 'twitter'

# Se pone en mayusculas pues en minusculas no lo detectaba pues el controller
# lo pensaba como una variable local, y de este modo se vuelve una constante
CLIENT = Twitter::REST::Client.new do |config|
  config.consumer_key        = "NxgmM9uC4xFlqw6eZbfAeSo82"
  config.consumer_secret     = "YhVOsdWmigMPi704iLOo7v6MM3GcwAJxs4oYMHHFKeCDSecNKz"
  config.access_token        = "744956354402496512-0oQPEhY1RNsEhL5eLsGugWZBXhG6y3d"
  config.access_token_secret = "16lk0RF17YeYynwjnoDryPWOPKN9k1jPDg1cSv6HOD6Dn"
end


APP_ROOT = Pathname.new(File.expand_path('../../', __FILE__))

APP_NAME = APP_ROOT.basename.to_s

# Configura los controllers y los helpers
Dir[APP_ROOT.join('app', 'controllers', '*.rb')].each { |file| require file }
Dir[APP_ROOT.join('app', 'helpers', '*.rb')].each { |file| require file }
Dir[APP_ROOT.join('app', 'uploaders', '*.rb')].each { |file| require file }

# Configura la base de datos y modelos 
require APP_ROOT.join('config', 'database')
