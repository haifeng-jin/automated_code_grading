require_relative 'executor'
require_relative 'temporary_files_info'
require_relative 'execute_result'

class JavaExecutor < Executor

  def copy_command
    "cp #{@program_path} #{@temp_files.get_copied_program_path}"
  end

  def compile_command
    "javac #{@temp_files.get_copied_program_path} -d #{@temp_files.get_runnable_path} 2> #{@temp_files.get_compile_message_path}"
  end
  
  def run_command
    "sh #{@relative_path}/run.sh #{@temp_files.get_runnable_path} #{@input_path} #{@temp_files.get_program_output_path}"
  end

  def total_line_command
    "wc -l #{@output_path}"
  end

  def diff_line_command
    "sh #{@relative_path}/count_diff.sh #{@output_path} #{@temp_files.get_program_output_path}"
  end

  def compile
    `#{copy_command}`
    `#{compile_command}`
    file = File.new(@temp_files.get_compile_message_path, "r")
    message = ""
    while (line = file.gets)
      message += line
    end
    file.close
    message
  end

  def run?
    `#{run_command}`
    return true
  end

  def score
    total_line_num = `#{total_line_command}`.split(" ").at(0).to_i
    diff_line_num = `#{diff_line_command}`.to_i / 2
    common_line_num = total_line_num - diff_line_num
    return (common_line_num * 1.0 / total_line_num * 100).to_i
  end

  def execute
    @relative_path = File.dirname(__FILE__)
    @result = ExecuteResult.new()
    @result.set_message(compile)

    if (@result.has_message?)
      @result.set_score(0)
      @result.set_judgement("Compile Error")
      return @result
    end

    if (run?)
      @result.set_score(score)
      @result.set_judgement("Success")
    else
      @result.set_score(0)
      @result.set_judgement("Error")
    end
    return @result
  end
end


