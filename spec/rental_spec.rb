require './rental'
require './student'
require './book'
require './person'

describe Rental do
  context 'initialization' do
    it 'gets initialized with right data' do
      student = Student.new('14', nil, 'Peter')
      book = Book.new('Book Title', 'The Author')
      date = '2015-12-05'

      rental = Rental.new(date, book, student)

      expect(rental.date).to eq date
      expect(rental.person.name).to eq 'Peter'
      expect(rental.book.author).to eq 'The Author'
    end
  end
end
