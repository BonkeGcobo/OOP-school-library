require './student'
require './teacher'
require './book'
require './rental'
require './main_inputs'
require './handle_create'
require './handle_list'
require './display'
require './data'

class App
  attr_reader :people

  include Inputs
  include HandleCreate
  include HandleList
  include Display
  include Data

  def initialize
    @book_storage = retrieve
    puts retrieve
    @people = []
    @books = @book_storage
    @rentals = []
  end

  def run
    input = ''
    while input != '7'
      menu_items
      input = gets.chomp
      user_interactions(input)
      if(input =='7')
        save_book(@books)
        save_rental(@rentals)
        save_person(@people)
      end
    end
  end

  def user_interactions(input)
    interactions(input)
  end

  def create_person
    puts 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    person_create
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
    rental_create
    puts 'Rental Created Successfully'
  end

  def list_rentals
    puts 'Enter the person ID:'
    rental_list
  end
end
