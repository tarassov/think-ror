require_relative 'train.rb'
class CargoTrain < Train
    def new_wagon! number
        super.push_wagon(CargoWagon.new(number))
    end
end