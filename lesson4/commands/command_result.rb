class CommandResult
    attr_reader :success, :value
    def initialize(success, value)
        @success = success
        @value = value
    end
end