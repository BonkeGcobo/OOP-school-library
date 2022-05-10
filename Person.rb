class Person
  def initialize(age,name="unknown", parent_permission=true)
    @id
    @name = name
    @age = age
    @parent_permission = parent_permission 
  end

  def get_id
    return @id
  end

  def get_name
    return @name
  end
  
  def get_age
    return @age
  end

  def set_age (age)
    @age = age
  end

  def set_name (name)
    @name = name
  end

  def can_use_services? 
    return true if is_of_age? || @parent_permission
    return false
  end

  private
  def is_of_age?
    return true if @age > 18
    return false
  end
end
