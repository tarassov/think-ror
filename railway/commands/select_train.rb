require_relative 'command.rb'
require_relative 'command_result.rb'
class SelectTrain < Command
    
    def initialize (args)
        @trains = args[:trains]
    end

    protected
  
    def name  
       "Выбор поезда"
    end

    def do_call
        raise("Нет поездов для выбора")  if @trains.count == 0

        puts "Выберите поезд"
        @trains.each_with_index do |train, index| 
            puts "#{index+1} - Поезд номер:#{train.number} - #{train} "
        end
        index = ask("Введите число", Numeric)-1
        
        return CommandResult.new(true,  @trains[index])
    end    


 
end