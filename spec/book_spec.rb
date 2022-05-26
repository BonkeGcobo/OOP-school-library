require './book'

describe Book do
  context "Check if book work as it should" do
    it "Check if the Book is being initialized" do
      book = Book.new("Born a Crime", "Trevor")
      author = book.author
      expect(author).to eq("Trevor")
    end
  end    
end
