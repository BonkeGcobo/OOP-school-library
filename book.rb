require './rental.rb'
class Book
  attr_accessor :title
  attr_accessor :author

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end
end