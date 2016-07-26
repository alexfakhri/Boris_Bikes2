require_relative 'bike'

class DockingStation
  include BikeContainer

  def release_bike
    fail 'No bikes available' if working_bikes.empty?
    bikes.delete working_bikes.pop
  end

  def dock(bike)
    fail 'Docking station full' if full?
    @bikes << bike
  end

  private

  def working_bikes
    bikes.reject { |bike| bike.broken? }
  end

end
