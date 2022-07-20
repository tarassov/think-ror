require_relative 'command_result.rb'

class Command

    def self.execute (*args)
        new(*args).call
    end

    def call
        puts "-----------------"
        puts "Вызов команды: " +  name
        result  = do_call
        puts "Результат выполнения":  result.value if result.success
        puts "Ошибка":  result.value unless result.success
        puts "-----------------"
        return result
    end

    protected
    def do_call
       raise "NotImplementedError"
    end

    def name 
       "Unknow command"
    end

    def choose_station (question, stations)
        puts question
        stations.each_with_index do |station, index| 
            puts "#{index+1} - #{station.name}"
        end
        return ask("Введите число", Numeric)-1
    end

    def choose_route (question, routes)
        puts question
        routes.each_with_index do |route, index| 
            stations = route.stations.map{|station| station.name}
            puts "#{index+1} - #{stations}"
        end
        return ask("Введите число", Numeric)-1
    end   

end