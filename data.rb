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
        json = JSON.generate(data)
        list_add.puts(json)
      }
    end
  end
  
  def retrieve
    book = []
    #book_file = IO.sysopen('./book.json','r')
    #list_data = IO.new(book_file)
    file = File.open('book.json')
    file_data = file.readlines.map(&:chomp)
    file_data.each {
      |data| 
      parseData = JSON.parse(data, object_class: Book)
      book.push(parseData);
      #puts parseData.class
    }
    book
  end
end

#data = Data.new
#puts data.retrieve