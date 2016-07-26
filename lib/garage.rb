require_relative 'bike_container'

class Garage

  include BikeContainer

  def fix_bike(bike)
    bike.fix(bike)
  end

end
