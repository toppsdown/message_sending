require 'sinatra'
require_relative 'lib/services/file_writer'

PATH_TO_FILE = File.expand_path(File.join(File.dirname(__FILE__), 'messages.txt'))
DEBUG = false

get '/' do
  get_debug_info if DEBUG
  get_file_contents
  erb :index
end

post '/' do
  get_debug_info if DEBUG
  @response_message = []
  @response_message << "Your message was received as: '#{params[:message]}'"
  @response_message << "Attempting to save to #{PATH_TO_FILE}"

  file = FileWriter.new(PATH_TO_FILE)
  file.write(params[:message])

  get_file_contents
  erb :index
end

def get_file_contents
  file = FileWriter.new(PATH_TO_FILE)
  @contents = file.read
end

def get_debug_info
  @debug_message = []

  request = @request.env
  @debug_message << "Received message from: #{request['REMOTE_ADDR']}"
  @debug_message << "Method of request: #{request['REQUEST_METHOD']}"
  @debug_message << "Params were: #{params.to_s}"

  $stdout.puts @debug_message.join("\n")
  @debug_message
end
