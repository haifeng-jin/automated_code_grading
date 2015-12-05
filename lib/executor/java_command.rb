require_relative 'command'
class JavaCommand < Command
  def copy_command
    "cp #{@program_path} #{@temp_files.get_temp_path}/Main.java"
  end

  def compile_command
    "javac #{@temp_files.get_temp_path}/Main.java -d #{@temp_files.get_runnable_path} 2> #{@temp_files.get_compile_message_path}"
  end
  
  def run_command
    "sh #{@relative_path}/run.sh #{@temp_files.get_runnable_path} #{@input_path} #{@temp_files.get_program_output_path} #{@temp_files.get_error_path}"
  end

  def remove_command
    "sh #{@relative_path}/remove.sh #{@temp_files.get_temp_path}/Main.java #{@temp_files.get_temp_path}/Main.class #{@temp_files.get_program_output_path} #{@temp_files.get_error_path}"
  end

end
