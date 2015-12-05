class TemporaryFilesInfo

  def initialize(temp_path)
    @temp_path = temp_path
    @runnable_path = @temp_path;
    @compile_message_path = @temp_path + "/compile_message"
    @program_output_path = @temp_path + "/output"
    @error_path = @temp_path + "/runtime_error"
  end
  
  def get_temp_path
    @temp_path
  end

  def get_error_path
    @error_path
  end

  def get_compile_message_path
    @compile_message_path
  end

  def get_runnable_path
    @runnable_path
  end

  def get_program_output_path
    @program_output_path
  end
end
