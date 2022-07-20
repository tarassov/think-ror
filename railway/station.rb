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
        validate!
        register_instance
    end

    def valid?
        validate!
        true
    rescue
        false
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
    protected
    def validate!
        raise "Name should be at least 3 symbols" if name.length < 3
    end
    
end