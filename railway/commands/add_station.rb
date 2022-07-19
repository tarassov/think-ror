require_relative 'command.rb'
require_relative 'command_result.rb'
class AddStation < Command
    
    def initialize args
        @routes = args[:routes]
        @stations = args[:stations]
    end

    protected
  
    def name  
       "Добавление станции в маршрут"
    end

    def do_call
        return CommandResult.new(false, "Не создано ни одной станции")  if @stations.count == 0
        return CommandResult.new(false, "Не создано ни одного маршрута")  if @routes.count == 0

        route_index = choose_route("Выберите маршрут", @routes)
        station_index = choose_station("Выберите станцию ", @stations)
        @routes[route_index].add_station(@stations[station_index])
        
        return CommandResult.new(true,  @routes[route_index])
    end    


 
end