require_relative 'input_csv_parser'

class CSVFileAggregator

  def initialize(input_dir)
    @input_dir = input_dir
    ::InputCsvParser.new
  end

  def aggregate
    output = File.new("commute-from-aggregated.csv", "w")

    output.write("Input File,Station,Average House Price,Destination,Duration,Frequency,Changes,Primary Schools Link,Secondary Schools Link\n")

    Dir.foreach(@input_dir) do |file_name|
      next if file_name == '.' || file_name == '..'
      puts "Inspecting :[#{file_name}]..."
      areas = InputCsvParser.new.parse(File.join(@input_dir, file_name))
      areas.each do |key, value|
        escaped_name = key.gsub(/ /, "%20")

        primary_url = "http://home.rm.com/schoolfinder/ShowSchools.aspx?l=#{escaped_name}&t=pri"
        secondary_url = "http://home.rm.com/schoolfinder/ShowSchools.aspx?l=#{escaped_name}&t=sec"
        area_details = "#{file_name},#{value.name},#{value.average_house_price}"

        value.journeys.each{|journey| output.write "#{area_details},#{journey.destination_station},#{journey.duration},#{journey.frequency},#{journey.changes},#{primary_url},#{secondary_url}\n" }
      end

      puts "Done. #{areas.size}"
    end
    output.close
  end
end

input_dir = ARGV[0]

aggregator = CSVFileAggregator.new(input_dir)

aggregator.aggregate
