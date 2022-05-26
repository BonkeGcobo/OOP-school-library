require './book'
require './person'
describe Book do
  context 'Check if book work as it should' do
    book = Book.new('Born a Crime', 'Trevor')
    it 'Check if the Book is being initialized' do
      author = book.author
      expect(author).to eq('Trevor')
    end

    it 'Test if rental can be added' do
      person = Person.new('14', 'Bonke')
      book.add_rental(person, '2020')
      expect(book.rentals.length) == 1
    end
  end
end
