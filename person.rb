require './nameable'
require './rental.rb'
class Person < Nameable
  def initialize(age,name = 'unknown', parent_permission: true)
    super()
    @id = Random.rand(1...1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def find_id
    @id
  end

  def find_name
    @name
  end

  def find_age
    @age
  end

  def add_age(age)
    @age = age
  end

  def add_name(name)
    @name = name
  end

  def can_use_services?
    return true if is_of_age? || @parent_permission

    false
  end

  def correct_name
    @name
  end

  private

  def of_age?
    return true if @age > 18

    false
  end
end
