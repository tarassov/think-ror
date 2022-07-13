require_relative 'ask.rb'
require_relative 'application.rb'

app = Application.new

loop do
    puts "-----------------"
    puts "Что делаем?"
    puts "1 -cоздавать станцию"
    puts "2 -cоздать поезд"
    puts "-----------------"
    menu = ask "Введите номер пункта меню", Numeric
    case menu
        when 2 
            app.create_train

    end

end


