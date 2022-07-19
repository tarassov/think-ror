require_relative '../modules/manufacturer.rb'

class Wagon 
    attr_reader :number
    include Manufacturer
    include InstanceCounter
    def initialize (number)
        @number = number
        register_instance
    end
end