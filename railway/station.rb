require_relative 'route.rb'
require_relative 'trains/train.rb'
require_relative 'modules/instance_counter.rb'


class Station
    attr_reader :name
    attr_reader :trains
    include InstanceCounter
  

    def initialize (name)
        @name = name
        @trains = []
        register_instance
    end

    def receive (train)
        unless @trains.include?(train)
            @trains << train
        end    
    end

    def trains_by_type (type)
        res = []
        @trains.each {|train| res<< train if train.type == type}
        res
    end

    def leave train 
        @trains.delete(train)
    end

    
end