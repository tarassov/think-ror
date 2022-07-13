require_relative 'train.rb'
class PassnegerTrain < Train
    def new_wagon! number=""
        super.push_wagon(PassengerWagon.new(number))
    end
end