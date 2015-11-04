class TemporaryFilesInfo
  @@temp_path = File.dirname(__FILE__) + "/tmp"
  @@runnable_path = @@temp_path;
  @@compile_message_path = @@temp_path + "/message"
  @@program_output_path = @@temp_path + "/output2"
  

  def self.get_compile_message_path
    @@compile_message_path
  end

  def self.get_runnable_path
    @@runnable_path
  end

  def self.get_program_output_path
    @@program_output_path
  end
end
