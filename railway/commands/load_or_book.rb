require_relative 'command.rb'
require_relative 'command_result.rb'
class LoadOrBook < Command
    
    def initialize (args)
        @train = args[:train]
    end

    protected
  
    def name  
        "Погрузить груз/Забронировать место"
    end

    def do_call
        raise("Нет вагонов для выбора")  if @train.wagons == 0

        puts "Выберите вагон"

        @train.wagons.each_with_index do |wagon, index| 
            puts "#{index+1} - Вагон номер:#{wagon.number} - #{wagon} "
        end
        index = ask("Введите число", Numeric)-1

        puts @train.wagons.count

        if index <= @train.wagons.count
            if @train.instance_of?(PassnegerTrain)
                @train.wagons[index].book_seat
            else
                @train.wagons[index].load_cargo
            end

            return CommandResult.new(true,  @train) 
        else
            return CommandResult.new(false,  "ошибка") 
        end
    end    


 
end