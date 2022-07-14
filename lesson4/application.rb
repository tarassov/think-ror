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
require_relative 'station.rb'
require_relative 'route.rb'

class Application
    def initialize
        @trains = Array.new
        @stations = Array.new
        @routes = Array.new    
        @config = {trains: @trains, stations: @stations, route: @routes}    
    end

    def create_station
        result = CreateStation.execute({stations: @stations})
        @stations << result.value  if result.success
    end   

    def create_train
        result = CreateTrain.execute({trains: @trains})
        @trains << result.value  if result.success
    end    

    def create_route
        result = CreateRoute.execute({stations: @stations, routes: @routes})
        @routes << result.value  if result.success
    end

    def add_station
        result = AddStation.execute({stations: @stations, routes: @routes})
    end

    def delete_station
        result = DeleteStation.execute({stations: @stations, routes: @routes})
    end


    def select_train
        result = SelectTrain.execute(@config)
        return result.value  if result.success
        return false
    end

    def set_route(train)
        result = SetRoute.execute({train: train, routes: @routes})
    end

    def add_wagon(train)
        result = AddWagon.execute({train: train})
    end

    def pop_wagon(train)
        result = PopWagon.execute({train: train})
    end


 
end