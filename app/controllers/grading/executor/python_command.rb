require_relative 'command'
class PythonCommand < Command
  def copy_command
    "cp #{@program_path} #{@temp_files.get_temp_path}/main.py"
  end

  def compile_command
    "touch #{@temp_files.get_compile_message_path}"
  end
  
  def run_command
    "sh #{@relative_path}/run_py.sh #{@temp_files.get_temp_path} #{@input_path} #{@temp_files.get_program_output_path} #{@temp_files.get_error_path}"
  end

  def remove_command
    "sh #{@relative_path}/remove.sh #{@temp_files.get_temp_path}/main.py #{@temp_files.get_compile_message_path} #{@temp_files.get_program_output_path} #{@temp_files.get_error_path}"
  end

end
