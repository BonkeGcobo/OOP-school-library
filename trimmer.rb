require './basedecorator'
require './person'
require './capitalize'

class TrimmerDecorator < BaseDecorator
  def correct_name
    return @nameable.correct_name[0, 10] if @nameable.correct_name.length > 10

    @name.correct_name
  end
end
