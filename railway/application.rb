require_relative 'ask.rb'
require_relative 'trains/cargo_train.rb'
require_relative 'trains/passenger_train.rb'
require_relative 'commands/create_train.rb'
require_relative 'commands/create_station.rb'
require_relative 'commands/create_station.rb'
require_relative 'commands/add_station.rb'
require_relative 'commands/delete_station.rb'
require_relative 'commands/create_route.rb'
require_relative 'commands/select_train.rb'
require_relative 'commands/add_wagon.rb'
require_relative 'commands/pop_wagon.rb'
require_relative 'commands/set_route.rb'
require_relative 'commands/move_next.rb'
require_relative 'commands/move_previous.rb'
require_relative 'station.rb'
require_relative 'route.rb'

class Application
    attr_accessor :config
    def initialize
        puts "Application created\n You can run app.menu to launch the menu"
        trains = Array.new
        stations = Array.new
        routes = Array.new    
        @config = {trains: trains, stations: stations, routes: routes}    
    end

    def create_station
        result = CreateStation.execute(@config)
        @config[:stations] << result.value  if result.success
    end   

    def create_train
        result = CreateTrain.execute(@config)
        @config[:trains] << result.value  if result.success
    end    

    def create_route
        result = CreateRoute.execute(@config)
        @config[:routes] << result.value  if result.success
    end

    def add_station
        result = AddStation.execute(@config)
    end

    def delete_station
        result = DeleteStation.execute(@config)
    end


    def select_train
        result = SelectTrain.execute(@config)
        return result.value  if result.success
        return false
    end

    def set_route(train)
        result = SetRoute.execute({train: train, routes: @config[:routes]})
    end

    def add_wagon(train)
        result = AddWagon.execute({train: train})
    end

    def pop_wagon(train)
        result = PopWagon.execute({train: train})
    end

    def move_next(train)
        result = MoveNext.execute({train: train})
    end

    def move_previous(train)
        result = MovePrevious.execute({train: train})
    end

    def select_station
        puts "???????????????? ??????" if @config[:stations].count == 0
        @config[:stations].each do |station|
            trains = station.trains.map{|train| train.number}
            puts "???????????????? #{station.name}  ???????????? ?????????????? ???? ??????????????: #{trains}"
        end
    end

    def menu
        loop do
            puts "-----------------"
            puts "?????? ?????????????"
            puts "1 - c???????????? ??????????????"
            puts "2 - c???????????? ??????????"
            puts "3 - c???????????? ??????????????"
            puts "4 - ???????????????? ??????????????"
            puts "5 - ?????????????? ??????????????"
            puts "6 - ?????????????? ??????????"
            puts "7 - ???????????????? ????????????????"
            puts "8 - ??????????"
            puts "-----------------"
            menu = ask "?????????????? ?????????? ???????????? ????????", Numeric
            case menu
                when 1 then create_station
                when 2 then create_train
                when 3 then create_route
                when 4 then add_station
                when 5 then delete_station
                when 6 then train_manu(select_train)
                when 7 then select_station    
                when 8 then break    
            end
        
        end
    end

    def train_manu(train)
        return unless train.kind_of?(Train) 
        loop do
            puts "-----------------"
            puts "???????????? ?????????? #{train}"
            puts "?????? ?????????????"
            puts "1 -?????????????????? ?????????? ???? ??????????????"
            puts "2 -???????????????? ??????????"
            puts "3 -???????????????? ??????????"
            puts "4 -?????????? ?????????????? ????????????"
            puts "5 -?????????? ?????????????? ??????????"
            puts "6 -?????????? ?? ?????????? ????????"
            menu = ask "?????????????? ?????????? ???????????? ????????", Numeric
            case menu
                when 1 then set_route (train)
                when 2 then add_wagon(train)
                when 3 then pop_wagon (train)
                when 4 then move_next(train)
                when 5 then move_previous(train)
                when 6 then break
            end
        end
    end




 
end