require_relative 'command.rb'
require_relative 'command_result.rb'
class SetRoute < Command
    
    def initialize (args)
        @routes = args[:routes]
        @train = args[:train]
    end

    protected
  
    def name  
       "Назначить на маршрут"
    end

    def do_call
        raise("Нет маршрутов для выбора")  if @routes.nil? || @routes.count == 0

        index = choose_route("Выберите маршрут", @routes)

        @train.route =  @routes[index]

        return CommandResult.new(true,  @train)
    end    


 
end