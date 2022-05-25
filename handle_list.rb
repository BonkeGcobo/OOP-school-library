module HandleList
  def handle_list(list_items)
    if list_items == @people
      list_items.each_with_index do |person, index|
        puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.find_id}, Age: #{person.age}", "\n"
      end
    else
      list_items.each_with_index do |book, index|
        print "#{index}) Title: #{book.title} Author: #{book.author}", "\n"
      end
    end
  end

  def rental_list
    id = gets.chomp
    puts 'Rentals:'
    @rentals.each do |rental|
      puts "Date #{rental.date}, Book #{rental.book.title} by #{rental.book.author}"
    end
  end
end
