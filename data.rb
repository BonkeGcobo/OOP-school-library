require './book.rb'
require 'json'

module Data
  def save_data(list,string_list)
    file_path = IO.sysopen("./#{string_list}.json",'w+')
    list_add = IO.new(file_path)
    list.each{ |data|
      json = JSON.generate(data)
      list_add.puts(json)
    }
  end
end
