require_relative 'ask.rb'
require_relative 'trains/cargo_train.rb'
require_relative 'trains/passenger_train.rb'
require_relative 'commands/create_train.rb'
require_relative 'commands/create_station.rb'
require_relative 'station.rb'

class Application
    def initialize
        @trains = Array.new
        @stations = Array.new
    end

    def create_station
        result = CreateStation.execute({stations: @stations})
        @stations << result.value  if result.success
    end   

    def create_train
        result = CreateTrain.execute({trains: @trains})
        @trains << result.value  if result.success
    end    
 
end