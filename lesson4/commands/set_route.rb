require_relative 'command.rb'
require_relative 'command_result.rb'
class SetRoute < Command
    
    def initialize args
        @routes = args[:routes]
        @train = args[:train]
    end

    protected
  
    def name  
       "Назначить на маршрут"
    end

    def do_call
        return CommandResult.new(false, "Нет маршрутов для выбора")  if @routes.count == 0

        route_index = choose_route("Выберите маршрут", @routes)

        index = ask("Введите число", Numeric)-1
        @train.route =  @routes[index]

        return CommandResult.new(true,  @train)
    end    


 
end