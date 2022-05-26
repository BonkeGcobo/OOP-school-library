require './rental'
require './person'
class Book
  attr_accessor :title, :author
  attr_reader :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(person, date)
    rental = Rental.new(date, self, person)
    @rentals.push(rental)
  end

  def make_hash
    hash = {}
    hash['title'] = @title
    hash['author'] = @author
    hash
  end
end
