require_relative '../station.rb'
require_relative '../route.rb'
require_relative '../modules/manufacturer.rb'
require_relative '../modules/instance_counter.rb'
require_relative '../modules/validation.rb'

class Train 
    attr_reader :number
    attr_reader :type
    attr_reader :speed

    attr_reader :route
    attr_reader :current_station    
    attr_reader :wagons

    include Manufacturer
    include InstanceCounter
    include Validation

    NUMBER_FORMAT = /^[a-zA-Z0-9]{3}-{0,1}[a-zA-Z0-9]{2}$/i
    
    def initialize (number)
        @number  = number
        @speed = 0
        @wagons = Array.new        
        validate!
        register_instance
    end


    def self.find(number)
        self.all.find{|train| train.number == number}
    end

  
    def accelerate!
        @speed +=1
    end 

    def slow_down!
        @speed -=1
    end

    def brake!
        @speed = 0
    end 

    def  route= (route)
        #delete from current route and stations
        if @route
            @current_station.leave(self)
        end
        @route = route
        if @route        
            @current_station =  @route.stations.first
            @current_station.receive(self)
        end    
    end

    def move_next
        until @route
            raise "No route"
        end
        next_station = @route.get_next(@current_station)
        if next_station
             @current_station.leave(self)
             next_station.receive(self)
             @current_station = next_station
        end
    end

    def move_previous
        until @route
            raise "No route"
        end
        prev_station = @route.get_previous(@current_station)
        if prev_station
             @current_station.leave(self)
             prev_station.receive(self)
             @current_station = prev_station
        end
    end

  

  
    def pop_wagon!  
        if @wagons.count == 0 
            raise "No wagons"
        end
        @wagons.pop
    end

    protected
    #метод используется в дочерних классах, где идет проверка на типа вагона, напрямую не вызывается
    def push_wagon! wagon
        @wagons << wagon
    end 

    private 
    #эти методы, который получают инофрмацию о маршруте исопльзуются только внутри базового  класса Train
    def next_station
        nil until @route
        @route.get_next(@current_station)
    end

    def prev_station
        nil until @route
        @route.get_previous(@current_station)
    end
    
    def validate!     
        errors = []   
        errors << "Number should be at least 5 symbols" if number.length < 5
        errors << "Number should be 6 or 5 symbols" if number.length > 6
        errors << "Number has invalid format" if number !~ NUMBER_FORMAT
        raise errors.join('.') unless errors.empty?
    end

end