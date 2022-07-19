require_relative 'command.rb'
require_relative 'command_result.rb'
class PopWagon < Command
    
    def initialize args
        @routes = args[:routes]
        @train = args[:train]
    end

    protected
  
    def name  
       "Отцепить вагон"
    end

    def do_call
        @train.pop_wagon!
        return CommandResult.new(true,  @train)
    end    


 
end