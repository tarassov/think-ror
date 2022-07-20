require_relative '../modules/manufacturer.rb'

class Wagon 
    attr_reader :number
    include Manufacturer
    include InstanceCounter

    
    def initialize (number)
        @number = number
        validate!
        register_instance
    end
    
    def valid?
        validate!
        true
    rescue
        false
    end
    protected
    def validate!
        raise "Wagon number can't be nil or empty" if number.nil? || number==""
    end
    
end