require './book.rb'
require 'json'

module Data
  def save_data(list,string_list)
    if(list ==[])
      puts "No #{string_list} data"
  
    else
      file_path = IO.sysopen("./#{string_list}.json",'w+')
      list_add = IO.new(file_path)
      list.each{ |data|
        hash = {"title":data.title, "author": data.author}
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