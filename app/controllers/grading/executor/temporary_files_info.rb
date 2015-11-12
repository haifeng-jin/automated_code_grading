class TemporaryFilesInfo

  def initialize(temp_path)
    @temp_path = temp_path
    @runnable_path = @temp_path;
    @compile_message_path = @temp_path + "/message"
    @program_output_path = @temp_path + "/output2"
    @copied_program_path = @temp_path + "/Main.java"
  end
  
  def get_copied_program_path
    @copied_program_path
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
