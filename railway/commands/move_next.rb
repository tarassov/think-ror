require_relative 'command.rb'
require_relative 'command_result.rb'
class MoveNext < Command
    
    def initialize (args)
        @routes = args[:routes]
        @train = args[:train]
    end

    protected
  
    def name  
        "Движение вперед"
    end

    def do_call
        raise  "Поезд не на маршруте" unless @train.route
        @train.move_next
        return CommandResult.new(true,  @train)
    end    


 
end