require_relative 'command_result.rb'
require_relative '../modules/logger.rb'

class Command
    include Logger

    def self.execute (*args)
        new(*args).call
    end

    def call
        log("Вызов команды: " +  name)
        begin
            result  = do_call
        rescue RuntimeError => e
            log("Ошибка: #{e.message}")
            retry if ask("Wanna try again? [yes/no]")=="yes"
            return CommandResult.new(false, e.message)
        end    
        log("Результат выполнения: #{result.value}") if result.success
        log("Ошибка: #{result.value}") unless result.success

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