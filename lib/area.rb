require 'active_record'


class Area < ActiveRecord::Base
  attr_reader :name, :journeys, :average_house_price

  def initialize(name, average_house_price)
    @name = name
    @average_house_price = average_house_price
    @journeys = Array.new
  end

  def add_journey(journey)
    @journeys << journey
  end
end

class Journey < ActiveRecord::Base
  attr_reader :duration, :destination_station, :frequency, :changes

  def initialize(destination_station, duration, changes, frequency)
    @destination_station = destination_station
    @duration = duration
    @changes = changes
    @frequency = frequency
  end
end

