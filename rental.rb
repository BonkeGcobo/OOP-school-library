class Rental
  attr_accessor :date
  attr_accessor :book
  def initialize (date,book)
    @date = date
    @book = book
  end
end