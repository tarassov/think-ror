require_relative 'command.rb'
require_relative 'command_result.rb'
class CreateStation < Command
    
    def initialize args
        @stations = args[:stations]
    end

    protected
  
    def name  
       "Создание станции"
    end

    def do_call
        name = ask "Введите название станции"
       
        if  @stations.any?{|t| t.name == name}
            return CommandResult.new(false, "Название уже занято")
        else
            station = Station.new(name)  
            return CommandResult.new(true, station)
        end
    end    
end