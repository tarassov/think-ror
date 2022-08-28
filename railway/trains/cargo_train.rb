require_relative 'train.rb'
require_relative 'cargo_wagon.rb'

class CargoTrain < Train
    def new_wagon! (number, max_volume)
        wagon = CargoWagon.new(number,max_volume)
        push_wagon!(wagon)
    end

    def train_type 
        "грузовой"
    end
    
end