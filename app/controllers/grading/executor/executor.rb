class Executor
  def initialize(program_path, input_path, output_path)
    @program_path = program_path
    @input_path = input_path
    @output_path = output_path
    @mutex = Mutex.new
  end
  
  def execute
  end
end
