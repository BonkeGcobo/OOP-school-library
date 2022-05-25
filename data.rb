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
      puts "No rental data"
  
    else
      file_path = IO.sysopen("./person.json",'w+')
      list_add = IO.new(file_path)
      list.each{ |data|
        if(data.class==Student)
          hash = {"age":data.age, "name": data.name}
        elsif(data.class==Teacher)
          hash = {"age": data.age, "name":data.name}
        end
        json = JSON.generate(hash)
        list_add.puts(json)
      }
    end


  end
  
  def retrieve
    book = []
    file = File.open('book.json')
    file_data = file.readlines.map(&:chomp)
    file_data.each {
      |data| 
      parseData = JSON.parse(data)
      make_book = Book.new(parseData["title"],parseData["author"])
      book.push(make_book);
    }
    book
  end
end