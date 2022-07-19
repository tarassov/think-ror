require_relative 'ask.rb'
require_relative 'application.rb'
require_relative 'seed.rb'


require_relative 'modules/instance_counter.rb'
require_relative 'modules/manufacturer.rb'

require_relative "station.rb"
require_relative "route.rb"

require_relative 'trains/train.rb'
require_relative 'trains/wagon.rb'
require_relative 'trains/cargo_wagon.rb'
require_relative 'trains/passenger_wagon.rb'
require_relative 'trains/cargo_train.rb'
require_relative 'trains/passenger_train.rb'

require_relative 'commands/command.rb'
require_relative 'commands/create_train.rb'
require_relative 'commands/create_station.rb'
require_relative 'commands/create_station.rb'
require_relative 'commands/add_station.rb'
require_relative 'commands/delete_station.rb'
require_relative 'commands/create_route.rb'
require_relative 'commands/select_train.rb'
require_relative 'commands/add_wagon.rb'
require_relative 'commands/pop_wagon.rb'
require_relative 'commands/set_route.rb'
require_relative 'commands/move_next.rb'
require_relative 'commands/move_previous.rb'

require_relative 'station.rb'
require_relative 'route.rb'

puts "Run app=Seed.run to create demo app"
puts "Run app=Application.new to create empty app"