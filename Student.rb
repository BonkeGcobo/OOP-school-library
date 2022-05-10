require './Person.rb'
class Student < Person 
  def initialize(age,name="unknown", parent_permission=true,classroom)
    super(age,name="unknown", parent_permission=true)
    @classroom=classroom
  end

  def play_hooky
    return "¯\(ツ)/¯"
  end
end