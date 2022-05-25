require './book'
require './student'
require './teacher'

module HandleCreate
  def book_create
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    book = Book.new(title, author)
    @books.push(book.create_hash)
  end

  def person_create
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
  end

  def rental_create
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
  end
end
