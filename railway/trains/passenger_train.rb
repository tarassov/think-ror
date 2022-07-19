require_relative 'train.rb'
require_relative 'passenger_wagon.rb'
class PassnegerTrain < Train
    def new_wagon!(number="")
        wagon = PassengerWagon.new(number)
        push_wagon!(wagon)
    end
end