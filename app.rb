require './student'
require './teacher'
require './book'
require './rental'
require './main_inputs'
require './handle_create'
require './handle_list'

class App
  attr_reader :people
  include Inputs
  include HandleCreate
  include HandleList 

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
    user_input(client_input)

  end

  def create_person
    puts 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    num_input = gets.chomp
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    person_create(num_input, age, name)
    puts 'Person created successfully'
  end

  def list_people
    handle_list(@people)
  end

  def create_book
    book_create
    puts 'Book created successfully'
  end

  def list_books
    handle_list(@books)
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
    handle_list(@rentals, id)
  end
end
