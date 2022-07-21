require_relative '../modules/manufacturer.rb'
require_relative '../modules/validation.rb'
class Wagon 
    attr_reader :number
    include Manufacturer
    include InstanceCounter
    include Validation

    
    def initialize (number)
        @number = number
        validate!
        register_instance
    end    

    protected
    def validate!
        raise "Wagon number can't be nil or empty" if number.nil? || number==""
    end
    
end