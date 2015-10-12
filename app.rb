require 'sinatra'

PATH_TO_FILE = File.expand_path(File.join(File.dirname(__FILE__), 'messages.txt'))

get '/' do
  @response_message = []
  @response_message << "Your message was received as: '#{params[:message]}'"
  @response_message << "Attempting to save to #{PATH_TO_FILE}"

  write_to_file(params[:message], PATH_TO_FILE)
  @contents = read_file(PATH_TO_FILE)

  erb :index
end


def write_to_file(message, path)
  File.open(path, 'a') do |file_object|
    file_object.puts(message)
  end
end


def read_file(path)
  file_object = File.new(path, 'r')
  contents = file_object.readlines
  file_object.close

  contents
end
