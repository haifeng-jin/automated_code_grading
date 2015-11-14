require_relative 'executor_factory'

# How to use this demo
#
# unzip all the files to "~/Desktop"
# then run the demo
#

def show(a)
  puts ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
  puts "The score is : " + a.get_score
  puts "The judgement is : " + a.get_judgement
  if a.has_message?
    puts "The message is :"
    puts a.get_message
  end
  puts ""
  puts ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
end

# the three parameter for the constructor of a JavaExecutor are:
# 1.Source file with absolute path (File name must be Main.java)
# 2.Input file with absolute path
# 3.Output file with absolute path

# the execute method of JavaExecutor will return a instance of ExecuteResult
# In the show() method above, you can see how to access the values of the result

puts "Success Example:"
show(ExecutorFactory.get_executor("/home/rainydays/Desktop/temp", "java", "~/Desktop/success/Main.java","~/Desktop/input","~/Desktop/output").execute)

puts "Compile Error Example:"
show(ExecutorFactory.get_executor("/home/rainydays/Desktop/temp", "java", "~/Desktop/compile_error/Main.java","~/Desktop/input","~/Desktop/output").execute)

puts "Low Score Example:"
show(ExecutorFactory.get_executor("/home/rainydays/Desktop/temp", "java", "~/Desktop/low_score/Main.java","~/Desktop/input","~/Desktop/output").execute)

puts "Memory Limit Exceeded Example:"
show(ExecutorFactory.get_executor("/home/rainydays/Desktop/temp", "java", "~/Desktop/mle/Main.java","~/Desktop/input","~/Desktop/output").execute)

puts "Time Limit Exceeded Example:"
show(ExecutorFactory.get_executor("/home/rainydays/Desktop/temp", "java", "~/Desktop/tle/Main.java","~/Desktop/input","~/Desktop/output").execute)

puts "Success Example:"
show(ExecutorFactory.get_executor("/home/rainydays/Desktop/temp", "python", "~/Desktop/success/main.py","~/Desktop/input","~/Desktop/output").execute)

puts "Low Score Example:"
show(ExecutorFactory.get_executor("/home/rainydays/Desktop/temp", "python", "~/Desktop/low_score/main.py","~/Desktop/input","~/Desktop/output").execute)

puts "Time Limit Exceeded Example:"
show(ExecutorFactory.get_executor("/home/rainydays/Desktop/temp", "python", "~/Desktop/tle/main.py","~/Desktop/input","~/Desktop/output").execute)

