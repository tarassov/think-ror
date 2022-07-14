require_relative 'ask.rb'
require_relative 'application.rb'
require_relative "trains/train.rb"

app = Application.new


def manage_train (app,train)
    return unless train.kind_of?(CargoTrain) 
    loop do
        puts "-----------------"
        puts "Выбран поезд #{train}"
        puts "Что делаем?"
        puts "1 -назначить поезд на маршрут"
        puts "2 -добавить вагон"
        puts "3 -отцепить вагон"
        puts "4 -поезд двинуть вперед"
        puts "5 -поезд двинуть назад"
        puts "6 -выйти в общее меню"
        menu = ask "Введите номер пункта меню", Numeric
        case menu
            when 1 then app.set_route (train)
            when 2 then app.add_wagon(train)
            when 3 then app.pop_wagon (train)
            when 4 then app.move_next(train)
            when 5 then app.move_previous(train)
            when 6 then break
        end
    end

end

loop do
    puts "-----------------"
    puts "Что делаем?"
    puts "1 - cоздать станцию"
    puts "2 - cоздать поезд"
    puts "3 - cоздать маршрут"
    puts "4 - добавить станцию"
    puts "5 - удалить станцию"
    puts "6 - выбрать поезд"
    puts "7 - выбрать станицию"
    puts "-----------------"
    menu = ask "Введите номер пункта меню", Numeric
    case menu
        when 1 then app.create_station
        when 2 then app.create_train
        when 3 then app.create_route
        when 4 then app.add_station
        when 5 then app.delete_station
        when 6 then manage_train(app,app.select_train)
        when 7 then app.select_station    
    end

end

