require_relative 'temporary_files_info'

class Executor
  def initialize(temp_path, program_path, input_path, output_path)
    @program_path = program_path
    @input_path = input_path
    @output_path = output_path
    @mutex = Mutex.new
    @temp_files = TemporaryFilesInfo.new(temp_path)
  end
  
  def execute
  end
end
