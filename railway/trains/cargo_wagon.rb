require_relative 'wagon.rb'

class CargoWagon < Wagon
    attr_reader :max_volume
    attr_reader :loaded_volume

    def initialize (number, max_volume)
        @max_volume = max_volume
        super(number)
    end    

    def load_cargo
        @loaded_volume = 1 + (@loaded_volume || 0)
    end

    def get_loaded_volume
        @loaded_volume
    end

    def get_free_volume
        @max_volume - (@loaded_volume || 0)
    end

    def wagon_type 
        "грузовой"
    end
    
end