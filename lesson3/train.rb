require_relative 'station.rb'
require_relative 'route.rb'

class Train 
    attr_reader :number
    attr_reader :type
    attr_reader :wagon_count
    attr_reader :speed

    attr_reader :route
    attr_reader :current_station    

    def initialize number, type, wagon_count
        @number  = number
        @wagon_count = wagon_count
        @speed = 0
        if !Train.train_types.include?(type)
            raise "Wrong type" 
        else
            @type = type
        end
    end

    def self.train_types
        [:cargo, :passenger]
    end

    def accelerate
        @speed +=1
    end 

    def slow_down
        @speed -=1
    end

    def brake
        @speed = 0
    end 

    def add_wagon
        @wagon_count +=1 if @speed == 0
    end
    
    def remove_wagon
        @wagon_count -=1 if @wagon_count >0 && @speed == 0
    end

    def  route= (route)
        #delete from current route and stations
        if @route
            @current_station.leave self
        end
        @route = route
        if @route        
            @current_station =  @route.stations.first
            @current_station.receive self
        end    
    end

    def move
        raise "No route" until @route
        next_station = @route.get_next @current_station
        if next_station
             @current_station.leave self
             next_station.receive self
             @current_station = next_station
        end
    end

    def next_station
        nil until @route
        @route.get_next @current_station
    end

    def prev_station
        nil until @route
        @route.get_previous @current_station
    end

end