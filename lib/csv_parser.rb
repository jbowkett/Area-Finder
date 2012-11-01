class CSVParser
  def parse(file_name)

    f = File.open(file_name)

    areas = Hash.new
    line_number = 0

    f.each_line { |line|

      line_number += 1

      next if line_number == 1

      line_segments = line.split ','
      area = line_segments[0]
      avg_house_price = line_segments[1]
      to_train_station = line_segments[2]
      journey_time = line_segments[3]
      changes = line_segments[4]
      frequency = line_segments[5]

      # Add repeated journeys from inout file onto one area
      area_obj = areas[area]
      if area_obj == nil

        area_obj = Area.new(area, avg_house_price)

        areas[area] = area_obj
      end

      journey = Journey.new(to_train_station, journey_time, changes, frequency)

      area_obj.add_journey(journey)
    }
    areas
  end
end




