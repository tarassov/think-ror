require_relative 'train.rb'
require_relative 'cargo_wagon.rb'

class CargoTrain < Train
    def new_wagon! (number)
        wagon = CargoWagon.new(number)
        push_wagon!(wagon)
    end
end