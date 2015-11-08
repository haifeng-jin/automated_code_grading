require_relative 'executor/java_executor'
require_relative 'executor_factory'

# How to use this demo
#
# unzip all the files to "~/Desktop"
# then run the demo
#

def show(a)
  puts "The score is : " + a.get_score
  puts "The judgement is : " + a.get_judgement
  if a.has_message?
    puts "The message is :"
    puts a.get_message
  end
  puts ""
end

# the three parameter for the constructor of a JavaExecutor are:
# 1.Source file with absolute path (File name must be Main.java)
# 2.Input file with absolute path
# 3.Output file with absolute path

# the execute method of JavaExecutor will return a instance of ExecuteResult
# In the show() method above, you can see how to access the values of the result

puts "Success Example:"
show(ExecutorFactory.get_executor("java", "~/Desktop/success/abc.txt","~/Desktop/input","~/Desktop/output").execute)

puts "Compile Error Example:"
show(ExecutorFactory.get_executor("java", "~/Desktop/compile_error/Main.java","~/Desktop/input","~/Desktop/output").execute)

puts "Low Score Example:"
show(ExecutorFactory.get_executor("java", "~/Desktop/low_score/Main.java","~/Desktop/input","~/Desktop/output").execute)

