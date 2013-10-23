class Person
  def initialize(name)
    @name = name
  end

  def welcome
    puts "Hi, my name is #{@name}"
  end
end

class Student < Person
  def learn
    puts "I get it!"
  end
end

class Instructor < Person
  def teach
    puts "Everything in Ruby is an object!"
  end
end

chris = Instructor.new("Chris")
chris.welcome
christina = Student.new("Christina")
christina.welcome
chris.teach
christina.learn

#chris.learn
#christina.teach

=begin
Calling chris.learn and christina.teach will not work because we did not
initialize it, meaning that it is an undefined method. If we added each 
of them to the student class or the teacher classthen they would work fine.
=end