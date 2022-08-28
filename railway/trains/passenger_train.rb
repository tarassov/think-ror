require_relative 'train.rb'
require_relative 'passenger_wagon.rb'
class PassnegerTrain < Train
    def new_wagon!(number="", max_seats_number)
        wagon = PassengerWagon.new(number,max_seats_number)
        push_wagon!(wagon)
    end

    def train_type 
        "пассажирский"
    end
end