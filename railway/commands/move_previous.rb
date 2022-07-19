require_relative 'command.rb'
require_relative 'command_result.rb'
class MovePrevious < Command
    
    def initialize (args)
        @routes = args[:routes]
        @train = args[:train]
    end

    protected
  
    def name  
        "Движение назад"
    end

    def do_call
        return CommandResult.new(false,  "Поезд не на маршруте") unless @train.route
        @train.move_previous
        return CommandResult.new(true,  @train)
    end    


 
end