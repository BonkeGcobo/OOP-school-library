require './book.rb'
require 'json'

module Data
  def save_book(list)
    if(list ==[])
      puts "No Book data"
  
    else
      file_path = IO.sysopen("./book.json",'w+')
      list_add = IO.new(file_path)
      list.each{ |data|
        hash = {"title":data.title, "author": data.author}
        json = JSON.generate(hash)
        list_add.puts(json)
      }
    end
  end

  def save_rental(list)
    if(list ==[])
      puts "No rental data"
  
    else
      file_path = IO.sysopen("./rental.json",'w+')
      list_add = IO.new(file_path)
      list.each{ |data|
        hash = {"date":data.date, "book": data.book, "person": data.person}
        json = JSON.generate(hash)
        list_add.puts(json)
      }
    end


  end

  def save_person(list)
    if(list ==[])
      puts "No persom data"
    else
      file_path = IO.sysopen("./person.json",'w+')
      list_add = IO.new(file_path)
      list.each{ |data|
        if(data.class==Student)
          hash = {"age":data.age, "name": data.name}
          json = JSON.generate(hash)
          list_add.puts(json)
        elsif(data.class==Teacher)
          hash = {"age": data.age, "special":data.specialization, "name":data.name}
          json = JSON.generate(hash)
          list_add.puts(json)
        end
      }
    end


  end
  
  def retrieve
    book = []
    if(!File.zero?('./book.json'))
      file = File.open('./book.json')
      file_data = file.readlines.map(&:chomp)
      file_data.each {
        |data| 
        parseData = JSON.parse(data)
        make_book = Book.new(parseData["title"],parseData["author"])
        book.push(make_book);
      }
    end
    book
  end

  def retrieve_person
    person = []
    if(!File.zero?('./person.json'))
      file = File.open('./person.json')
      file_data = file.readlines.map(&:chomp)
      file_data.each {
        |data| 
        puts data
        parseData = JSON.parse(data)
        if(parseData.include?("special"))
          make_person = Teacher.new(parseData["age"],parseData["special"],parseData["name"])
          person.push(make_person);
        else
          make_person = Student.new(parseData["age"],nil,parseData["name"], parent_permission: true)
          person.push(make_person);
        end
      }
      person
    end
   person
  end

    def retrieve_rental
      rental = []
      if(File.zero?('./rental.json'))
    file = File.open('./rental.json')
    file_data = file.readlines.map(&:chomp)
    file_data.each {
      |data| 
      parseData = JSON.parse(data)
      make_rental = Rental.new(parseData["book"],parseData["person"])
      rental.push(make_rental);
    }
  end
    rental
  end
end