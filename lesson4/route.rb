require_relative 'station.rb'
require_relative 'trains/train.rb'

class Route
    attr_reader :stations
    
    def initialize (start_station, stop_station)
        @start_station = start_station
        @stop_station = stop_station
        @stations = [start_station, stop_station]
    end
    
    def add_station (station, index = -2)
        @stations.insert(index, station)
    end

    def get_previous (station)
        i = @stations.index(station)
        return nil if i == 0
        return @stations[i-1]
    end

    def get_next (station)
        i = @stations.index(station)
        return nil if i == @stations.count-1
        return @stations[i+1]
    end

    def reset_all
        @stations.each do |station|
            station.trains do |train|
                station.leave (train)
            end
        end 
    end

end