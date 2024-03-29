class FileWriter
  def initialize(given_path)
    @path = given_path
  end

  def write(message)
    File.open(@path, 'a') do |file_object|
      file_object.puts(message)
    end
  end

  def read
    if File.exist?(@path)
      file_object = File.new(@path, 'r')
      contents = file_object.readlines
      file_object.close

      contents
    else
      []
    end
  end
end
