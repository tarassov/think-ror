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

        trains =[CargoTrain.new("111-11"),CargoTrain.new("222-22"), PassnegerTrain.new("33s-as"),PassnegerTrain.new("4d3-sd")]
        
        trains[0].new_wagon!("Wagon1",10)
        trains[0].new_wagon!("Wagon2",5)
        trains[3].new_wagon!("Wagon3",100)

        trains[0].route= routes[0]
        trains[3].route= routes[1]

        app.config[:stations] = stations
        app.config[:routes] = routes
        app.config[:trains] = trains
        return app        
    end
end