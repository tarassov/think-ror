require_relative 'command.rb'
require_relative 'command_result.rb'
class AddWagon < Command
    
    def initialize(args)
        @routes = args[:routes]
        @train = args[:train]
    end

    protected
  
    def name  
       "Добваить вагон"
    end

    def do_call
        number  = ask("Введите номер вагона")
        if @train.instance_of? CargoTrain
            max_volume  = ask("Введите общий объем")
            wagon = @train.new_wagon!(number,max_volume)
        else
            max_seats_number  = ask("Введите общее количество мест")
            wagon = @train.new_wagon!(number,max_seats_number)
        end
        return CommandResult.new(true,  wagon)
    end    


 
end