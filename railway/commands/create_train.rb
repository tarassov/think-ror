require_relative 'command.rb'
require_relative 'command_result.rb'
class CreateTrain < Command
    
    def initialize args
        @trains = args[:trains]
    end
    protected
  
    def name  
       "Создание поезда"
    end

    def do_call
        type = ask "Выберите тип\n1 - Грузовой\n2 - Пассажирский\n3 -Выйти", Numeric
        return CommandResult.new(false, "выход") if type!=2 && type!=1
        number = ask "Введите номер поезда"
       
        if @trains.any?{|t| t.number == number}
            return CommandResult.new(false, "Номер поезда уже занят")
        else
            if type == 1 
                train = CargoTrain.new(number)
            else 
                train = PassnegerTrain.new(number)
            end    

            return CommandResult.new(true, train)
        end
    end    
end