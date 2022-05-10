require './person'
class Teacher < Person
  def initialize(age, _name = 'unknown', _parent_permission: true, specialization)
    super(age, name = 'unknown', parent_permission: true)
    @specialization = specialization
  end

  def can_use_services?
    true
  end

end
