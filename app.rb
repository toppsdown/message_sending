require 'sinatra'
require_relative 'lib/services/file_writer'

PATH_TO_FILE = File.expand_path(File.join(File.dirname(__FILE__), 'messages.txt'))

get '/' do
  @response_message = []
  @response_message << "Your message was received as: '#{params[:message]}'"
  @response_message << "Attempting to save to #{PATH_TO_FILE}"

  file = FileWriter.new(PATH_TO_FILE)

  file.write(params[:message])
  @contents = file.read

  erb :index
end
