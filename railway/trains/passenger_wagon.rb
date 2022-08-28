require_relative 'wagon.rb'

class PassengerWagon < Wagon
    attr_reader :max_seats_number
    attr_reader :occupied_seats

    def initialize (number, max_seats_number)
        @max_seats_number = max_seats_number
        super(number)
    end    

    def book_seat
        @occupied_seats = 1 + (@occupied_seats || 0)
    end

    def get_occupied_seats
        @occupied_seats
    end

    def get_empty_seats
        @max_seats_number - (@occupied_seats ||0)
    end

    def wagon_type 
        "пассажирский"
    end
end