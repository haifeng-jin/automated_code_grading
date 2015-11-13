require_relative 'temporary_files_info'

class Command
  def initialize(temp_path, program_path, input_path, output_path)
    @relative_path = File.dirname(__FILE__)
    @program_path = program_path
    @input_path = input_path
    @output_path = output_path
    @temp_files = TemporaryFilesInfo.new(temp_path)
  end

  def get_temp_files
    @temp_files
  end

  def total_line_command
    "wc -l #{@output_path}"
  end

  def diff_line_command
    "sh #{@relative_path}/count_diff.sh #{@output_path} #{@temp_files.get_program_output_path}"
  end

  def copy_command
  end

  def compile_command
  end
  
  def run_command
  end

  def remove_command
  end


end
