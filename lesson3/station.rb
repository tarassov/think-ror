require_relative 'route.rb'
require_relative 'train.rb'


class Station
    attr_reader :name
    attr_reader :trains

    def initialize name
        @name = name
        @trains = []
    end

    def receive train
        unless @trains.include?(train)
            @trains << train
        end    
    end

    def trains_by_type type
        res = []
        @trains.each {|train| res<< train if train.type == type}
        res
    end

    def leave train 
        @trains.delete(train)
    end

    
end