require './book'
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
    arr = []
    if(list ==[])
      puts "No rental data"
    else
      # file_path = IO.sysopen("./rental.json",'w+')
      # list_add = IO.new(file_path)
      # list.each{ |data|
      #   book_hash = {"title": data.book.title, "author": data.book.author}
      #   person_hash = {"age": data.person.age, "name": data.person.name}
      #   hash = {"ID": data.person.find_id, "date":data.date, "book": book_hash, "person": person_hash}
      #   json = JSON.generate(hash)
      #   list_add.puts(json)
      # }
      list.each do |rental|
      arr.push({
        ID: rental.person.find_id,
        date: rental.date,
        book: rental.book,
        person: rental.person
      })
    end
    File.write("./rental.json", JSON.generate(arr).to_s)
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

<<<<<<< HEAD
  def retrieve_rental(id)
    rental = []
    if(!File.zero?('./rental.json'))
      file = File.open('./rental.json')
      file_data = file.readlines.map(&:chomp)
      file_data.each {
        |data|
        parseData = JSON.parse(data)
        book = parseData["book"]  #"book":{"title":"man","author":"men"}
        person = parseData["person"] #"person":{"age":"41","name":"bb"}
        if(id==parseData["ID"])
          make_rental = Rental.new(parseData["date"], Book.new(book['title'], book['author']), Book.new(person["age"], person["name"]))
          rental.push(make_rental);
        end
      }
=======
    def retrieve_rental(id)
     rentals = []
     if(!File.zero?('./rental.json'))
      # file = File.open('./rental.json')
      # file_data = file.readlines.map(&:chomp)
      # file_data.each {
      #   |data|
      #   parseData = JSON.parse(data)
      #   book = parseData["book"]
      #   person = parseData["person"]
      #   puts book
      #   make_rental = Rental.new(parseData["date"], Book.new(book['title'], book['author']), Book.new(person["age"], person["name"]))
      #   rental.push(make_rental);
      #   #if data.id.instance_of?id 
        
      # }
      puts JSON.parse(File.read('./rental.json')).each do |rental|
        rentals.push(Rental.new(rental["date"], rental["book"], rental["person"]))
      end
      rentals
>>>>>>> 0e00f46a32ecf14d3d8c2e12e7ae08207a37d6c5
     end
  end

end