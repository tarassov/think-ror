class Seed
    def self.run
        app = Application.new
        stations = [
        Station.new("Mercury"),
        Station.new("Venus"),
        Station.new("Earth"),
        Station.new("Mars"),
        Station.new("Jupiter"),
        Station.new("Saturn"),
        Station.new("Uranus"),
        Station.new("Neptune"),
        Station.new("Elon's home")]

        routes= [Route.new(stations[2],stations[8]),Route.new(stations[0],stations[5])]

        trains =[CargoTrain.new("1"),CargoTrain.new("2"), PassnegerTrain.new("3"),PassnegerTrain.new("4")]
        
        trains[0].new_wagon!(CargoWagon.new("Wagon1"))
        trains[0].new_wagon!(CargoWagon.new("Wagon2"))
        trains[3].new_wagon!(PassengerWagon.new("Wagon3"))

        trains[0].route= routes[0]
        trains[3].route= routes[1]

        app.config[:stations] = stations
        app.config[:routes] = routes
        return app        
    end
end