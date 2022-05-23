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
    @books.push(book)
  end

  def person_create(input, age, name)
    case input
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
end