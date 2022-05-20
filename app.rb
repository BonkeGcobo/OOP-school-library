require './student'
require './teacher'
class App
  attr_reader :people

  def initialize
    @people = []
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
      create_person if input == '3'
    end
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
end
app = App.new
app.run
