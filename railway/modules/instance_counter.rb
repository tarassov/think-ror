module InstanceCounter
    module ClassMethods
        def instances
            @instances || 0
        end

        def all
            @all || []
        end
        
        def register(instance)
            puts "#{instance} REGISTERED "
            @all = @all.to_a << instance
            @instances=@instances.to_i + 1
        end
    end
    
    
    module InstanceMethods
        protected
        def register_instance
            self.class.register(self)          
        end
    end

    def self.included(base)
        base.extend ClassMethods
        base.include InstanceMethods
    end
  

end