require_relative 'ask.rb'
require_relative 'application.rb'

app = Application.new

loop do
    puts "-----------------"
    puts "Что делаем?"
    puts "1 -cоздать станцию"
    puts "2 -cоздать поезд"
    puts "3 -cоздать маршрут"
    puts "4 -добавить станцию"
    puts "5 -удалить станцию"
    puts "-----------------"
    menu = ask "Введите номер пункта меню", Numeric
    case menu
        when 1 then app.create_station
        when 2 then app.create_train
        when 3 then app.create_route
        when 4 then app.add_station
        when 5 then app.delete_station

    end

end


