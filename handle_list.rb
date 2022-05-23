module HandleList 
  def handle_list(listItems, id=0)
    if listItems == @people
      listItems.each_with_index do |person, index|
      puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.find_id}, Age: #{person.age}", "\n"
      end
    elsif listItems == @books
      listItems.each_with_index do |book, index|
      print "#{index}) Title: #{book.title} Author: #{book.author}", "\n"
      end
    else 
      listItems.each do |rental|
      puts "Data #{rental.date}, Book #{rental.book.title} by #{rental.book.author}" if rental.person.find_id == id.to_i
      end
    end
  end
end