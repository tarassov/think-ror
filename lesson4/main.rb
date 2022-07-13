require_relative 'ask.rb'
require_relative 'application.rb'

app = Application.new

loop do
    puts "-----------------"
    puts "Что делаем?"
    puts "1 -cоздать станцию"
    puts "2 -cоздать поезд"
    puts "3 -cоздать маршрут"
    puts "-----------------"
    menu = ask "Введите номер пункта меню", Numeric
    case menu
        when 1
            app.create_station

        when 2 
            app.create_train
        when 3 
            app.create_route

    end

end


