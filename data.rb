require './book'
require 'json'

module Data
  def save_book(list)
    if list == []
      puts 'No Book data'

    else
      file_path = IO.sysopen('./book.json', 'w+')
      list_add = IO.new(file_path)
      list.each do |data|
        hash = { title: data.title, author: data.author }
        json = JSON.generate(hash)
        list_add.puts(json)
      end
    end
  end

  def start_file
    File.write('./rental.json', []) unless File.exist?('./rental.json')
  end

  def save_rental(list)
    if list == []
      puts 'No rental data'
    else
      rental_list = JSON.parse(File.read('./rental.json'))
      list.each do |rental|
        rental_list.push({
                           ID: rental.person.find_id,
                           date: rental.date,
                           book: { title: rental.book.title, author: rental.book.author },
                           person: { age: rental.person.age, name: rental.person.name }
                         })
      end
      File.write('./rental.json', JSON.generate(rental_list).to_s)
    end
  end

  def save_person(list)
    if list == []
      puts 'No persom data'
    else
      file_path = IO.sysopen('./person.json', 'w+')
      list_add = IO.new(file_path)
      list.each do |data|
        if data.instance_of?(Student)
          hash = { age: data.age, name: data.name }
          json = JSON.generate(hash)
          list_add.puts(json)
        elsif data.instance_of?(Teacher)
          hash = { age: data.age, special: data.specialization, name: data.name }
          json = JSON.generate(hash)
          list_add.puts(json)
        end
      end
    end
  end

  def retrieve
    book = []
    unless File.zero?('./book.json')
      file = File.open('./book.json')
      file_data = file.readlines.map(&:chomp)
      file_data.each do |data|
        parse_data = JSON.parse(data)
        make_book = Book.new(parse_data['title'], parse_data['author'])
        book.push(make_book)
      end
    end
    book
  end

  def retrieve_person
    person = []
    unless File.zero?('./person.json')
      file = File.open('./person.json')
      file_data = file.readlines.map(&:chomp)
      file_data.each do |data|
        parse_data = JSON.parse(data)
        make_person = if parse_data.include?('special')
                        Teacher.new(parse_data['age'], parse_data['special'], parse_data['name'])
                      else
                        Student.new(parse_data['age'], nil, parse_data['name'], parent_permission: true)
                      end
        person.push(make_person)
      end
      person
    end
    person
  end

  def retrieve_rental(id)
    rentals = []
    unless File.zero?('./rental.json')
      list = JSON.parse(File.read('./rental.json'))
      list.each do |rental|
        book = rental['book']
        person = rental['person']

        next unless id == rental['ID']

        rentals.push(Rental.new(rental['date'], Book.new(book['title'], book['author']),
                                Person.new(person['age'], person['name'])))
      end
    end
    rentals
  end
end
