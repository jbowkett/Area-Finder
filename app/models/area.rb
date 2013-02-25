require 'active_record'

class Area < ActiveRecord::Base
  has_many :journeys

  def initialize(name, average_house_price)
    super(:name => name, :average_house_price => average_house_price)
  end

  def add_journey(destination_station, duration, changes, frequency)
    journey = Journey.new(destination_station, duration, changes, frequency)
    journeys << journey
  end
end


