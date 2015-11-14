require_relative 'executor/executor.rb'
require_relative 'executor/java_command.rb'
require_relative 'executor/python_command.rb'

class ExecutorFactory
  def self.get_executor(path, language, program, input, output)
    if language == "java"
      return Executor.new(JavaCommand.new(path, program, input, output))
    end
    if language == "python"
      return Executor.new(PythonCommand.new(path, program, input, output))
    end
  end
end
