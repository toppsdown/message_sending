require 'sinatra'

PATH_TO_FILE = File.join(File.basename(__FILE__), 'messages.txt')

get '/' do
  "hello world"
  `cat #{params[:message]} > #{PATH_TO_FILE}`
  "Your message was received as: #{params[:message]}"
end
