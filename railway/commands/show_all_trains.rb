require_relative 'command.rb'
require_relative 'command_result.rb'
class ShowAllTrains < Command
    
    def initialize (args)
        @stations = args[:stations]
    end

    protected
  
    def name  
        "Все поезда"
    end

    def do_call
        @stations.each do |station|
            station.each_train do |train| 
                puts "Поезд: {Номер: #{train.number} | Тип:  #{train.train_type} | Количество выгонов: #{train.wagons.count}}"
                ShowWagons.execute({train: train})
            end
        end
        return CommandResult.new(true,  nil) 
    end    


 
end