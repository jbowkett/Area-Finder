class Area
  def initialize(name, average_house_price)
    @name = name
    @average_house_price = average_house_price
    @journeys = Array.new
  end

  def add_journey(journey)
    @journeys << journey
  end
end

class Journey
  def initialize(destination_station, duration, changes, frequency)
    @destination_station = destination_station
    @duration = duration
    @changes = changes
    @frequency = frequency
  end
end

