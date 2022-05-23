require './student'
require './teacher'
require './book'
require './rental'
require './main_inputs'
class App
  attr_reader :people
  include Inputs

  def initialize
    @people = []
    @books = []
    @rentals = []
  end

  def run
    input = ''
    while input != '7'
      puts '1- List all books'
      puts '2- List all people'
      puts '3- Create a person'
      puts '4- Create a book'
      puts '5- Create a rental'
      puts '6- List all rentals for a given id'
      puts '7- Exit'
      input = gets.chomp
      user_interactions(input)
    end
  end

  def user_interactions(client_input)
    Inputs.user_input(client_input)

  end

  def create_person
    puts 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    num_input = gets.chomp
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    case num_input
    when '1'
      print 'Has parent permission [Y/N]: '
      permission_input = gets.chomp.downcase
      permission = permission_input != 'n'
      person = Student.new(age, nil, name, parent_permission: permission)
      @people.push(person)
    when '2'
      print 'Specialization: '
      special = gets.chomp
      person = Teacher.new(age, special, name)
      @people.push(person)
    end
    puts 'Person created successfully'
  end

  def list_people
    @people.each do |person|
      puts "[#{person.class}] Name: #{person.name}, ID: #{person.find_id}, Age: #{person.age}", "\n"
    end
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    book = Book.new(title, author)
    @books.push(book)
    puts 'Book created successfully'
  end

  def list_books
    @books.each do |book|
      print "Title: #{book.title} Author: #{book.author}", "\n"
    end
  end

  def create_rental
    puts 'Select a book from the following list by number'
    @books.each_with_index do |book, index|
      print "#{index}) Title: #{book.title} Author: #{book.author}", "\n"
    end
    book = gets.chomp

    puts 'Select a person from the following list by number [not ID]'
    @people.each_with_index do |person, index|
      puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.find_id}, Age: #{person.age}", "\n"
    end
    person = gets.chomp
    print 'Date: '
    date = gets.chomp
    rental = Rental.new(date, @books[book.to_i], @people[person.to_i])
    @rentals.push(rental)
    puts 'Rental Created Successfully'
  end

  def list_rentals
    puts 'Enter the person ID:'
    id = gets.chomp
    puts 'Rentals:'
    @rentals.each do |rental|
      puts "Data #{rental.date}, Book #{rental.book.title} by #{rental.book.author}" if rental.person.find_id == id.to_i
    end
  end
end
