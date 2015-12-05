require_relative 'command'
require_relative 'execute_result'
require_relative 'temporary_files_info'
require 'timeout'

class Executor
  def initialize(command)
    @command = command
  end
  
  def compile
    `#{@command.copy_command}`
    `#{@command.compile_command}`
    file = File.new(@command.get_temp_files.get_compile_message_path, "r")
    message = ""
    while (line = file.gets)
      message += line
    end
    file.close
    message
  end

  def run
    timeout_in_seconds = 2
    begin
      Timeout::timeout(timeout_in_seconds) do
        `#{@command.run_command}`
      end
      rescue Timeout::Error
        return "Time Limit Exceeded"
    end
    if !File.exist?(@command.get_temp_files.get_error_path)
      temp_file = File.new(@command.get_temp_files.get_error_path, "w")
      temp_file.close
    end
    file = File.new(@command.get_temp_files.get_error_path, "r")
    message = ""
    while (line = file.gets)
      message += line
    end
    file.close
    if (message.include? "java.lang.OutOfMemoryError")
      return "Memory Limit Exceeded"
    end
    return "Success"
  end

  def score
    total_line_num = `#{@command.total_line_command}`.split(" ").at(0).to_i
    if (total_line_num == 0)
      return 100
    end
    diff_line_num = `#{@command.diff_line_command}`.to_i / 2
    common_line_num = total_line_num - diff_line_num
    return (common_line_num * 1.0 / total_line_num * 100).to_i
  end

  def remove_files
    `#{@command.remove_command}`
  end

  def execute
    @result = ExecuteResult.new()
    @result.set_message(compile)

    if (@result.has_message?)
      @result.set_score(0)
      @result.set_judgement("Compile Error")
      remove_files
      return @result
    end

    judgement = run
    @result.set_judgement(judgement)
    if (judgement == "Success")
      @result.set_score(score)
    else
      @result.set_score(0)
    end

    remove_files

    return @result
  end
end
