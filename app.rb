require 'sinatra'

PATH_TO_FILE = File.expand_path(File.join(File.dirname(__FILE__), 'messages.txt'))

get '/' do
  "hello world"
  response_message = []
  response_message << "Your message was received as: '#{params[:message]}'"
  response_message << "Attempting to save to #{PATH_TO_FILE}"
  output = system("echo #{params[:message]} > #{PATH_TO_FILE}")
  if output
    response_message << 'Save was successful'
  else
    response_message << 'Save was unsuccessful'
  end

  contents = `cat #{PATH_TO_FILE}`

  response_message << "File Contents: #{contents}"

  @message = response_message.join('<br/>')

  erb :index
end
