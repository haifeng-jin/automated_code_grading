require_relative 'executor/java_executor.rb'

class ExecutorFactory
  def self.get_executor(path, language, program, input, output)
    if language == "java"
      return JavaExecutor.new(path, program, input, output)
    end
    if language == "python"
    end
  end
end
