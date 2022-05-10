require './Person.rb'

class Teacher < Person
  def initialize (age,name="unknown", parent_permission=true,specialization)
    super(age,name="unknown", parent_permission=true)
    @specialization = specialization
  end

  def can_use_services?
    return true
  end
end