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
        wagon = @train.new_wagon!(number)
        return CommandResult.new(true,  wagon)
    end    


 
end