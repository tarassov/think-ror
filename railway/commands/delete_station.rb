require_relative 'command.rb'
require_relative 'command_result.rb'
class DeleteStation < Command
    
    def initialize (args)
        @routes = args[:routes]
        @stations = args[:stations]
    end

    protected
  
    def name  
       "Удаление станции из маршрут"
    end

    def do_call
        raise "Не создано ни одной станции"  if @stations.count == 0
        raise "Не создано ни одного маршрута"  if @routes.count == 0

        route_index = choose_route("Выберите маршрут", @routes)
        station_index = choose_station("Выберите станцию ",  @routes[route_index].stations)
        @routes[route_index].remove_station(@stations[station_index])
        
        return CommandResult.new(true,  @routes[route_index])
    end    


 
end