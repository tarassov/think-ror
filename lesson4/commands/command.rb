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
    

end