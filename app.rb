class App
  def run
    input = ""
    while(input!="7")
      puts "1- List all books"
      puts "2- List all people"
      puts "3- Create a person"
      puts "4- Create a book"
      puts "5- Create a rental"
      puts "6- List all rentals for a given id"
      puts "7- Exit"
      input = gets.chomp
    end   
  end
end
