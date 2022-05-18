require './student.rb'
class Classroom
  attr_accessor :label
  
  def initialize(label)
    @label = label
    @students = []
  end
  
  def addStudent (student)
    @students.push(student)
    @student.classroom = self
  end

end