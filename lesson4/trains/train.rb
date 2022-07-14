require_relative '../station.rb'
require_relative '../route.rb'

class Train 
    attr_reader :number
    attr_reader :type
    attr_reader :speed

    attr_reader :route
    attr_reader :current_station    
    attr_reader :wagons

    def initialize (number)
        @number  = number
        @speed = 0
        @wagons = Array.new
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
            puts "No route"
            return
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
            puts "No route"
            return
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
            puts "No wagons"
            return
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


end