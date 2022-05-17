require './basedecorator.rb'
require './person.rb'
require './capitalize.rb'

class TrimmerDecorator < BaseDecorator
  def initialize(nameable)
    super(nameable)
  end

  def correct_name
    return (@nameable.correct_name)[0,10] if (@nameable.correct_name).length>10

    @name.correct_name
  end
end
