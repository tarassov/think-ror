require_relative 'command.rb'
require_relative 'command_result.rb'
class ShowWagons < Command
    
    def initialize (args)
        @train = args[:train]
    end

    protected
  
    def name  
        "Все вагоны"
    end

    def do_call
        @train.each_wagon  do |w| 
            if w.instance_of?(PassengerWagon)
              puts "Вагон: {Номер: #{w.number}| Тип: #{w.wagon_type} | Мест всего #{w.max_seats_number} | Мест свободно: #{w.get_empty_seats}"
            else
              puts "Вагон: {Номер: #{w.number} | Тип: #{w.wagon_type} | Общий объем: #{w.max_volume} | Свободный объем: #{w.get_free_volume}}"
            end
        end
        return CommandResult.new(true,  nil) 
    end    


 
end