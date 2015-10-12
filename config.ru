# for heroku

$stdout.sync = true

require './app'
run Sinatra::Application
