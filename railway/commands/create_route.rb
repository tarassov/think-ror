require_relative 'command.rb'
require_relative 'command_result.rb'
class CreateRoute < Command
    
    def initialize args
        @routes = args[:routes]
        @stations = args[:stations]
    end

    protected
  
    def name  
       "Создание маршрута"
    end

    def do_call
        return CommandResult.new(false, "Не создано ни одной станции")  if @stations.count == 0

        start_index = choose_station("Выберите станцию отправления", @stations)
        stop_index = choose_station("Выберите станцию остановки", @stations)
   

        return CommandResult.new(true, Route.new(@stations[start_index],@stations[stop_index]))
    end   

end