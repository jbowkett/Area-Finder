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
      areas_map = InputCsvParser.new.parse(File.join(@input_dir, file_name))
      areas_map.each do |key, value|
        escaped_name = key.gsub(/ /, "%20")

        primary_url = "http://home.rm.com/schoolfinder/ShowSchools.aspx?l=#{escaped_name}&t=pri"
        secondary_url = "http://home.rm.com/schoolfinder/ShowSchools.aspx?l=#{escaped_name}&t=sec"
        area_details = "#{file_name},#{value.name},#{value.average_house_price}"

        value.journeys.each{|journey| output.write "#{area_details},#{journey.destination_station},#{journey.duration},#{journey.frequency},#{journey.changes},#{primary_url},#{secondary_url}\n" }
        value.save
      end

      puts "Done. #{areas_map.size}"
    end
    output.close
  end
end


ActiveRecord::Base.establish_connection(
    :adapter  => "mysql",
    :host     => "localhost",
    :username => "root",
    :password => "",
    :database => "area_finder"
)



input_dir = ARGV[0]

aggregator = CSVFileAggregator.new(input_dir)

aggregator.aggregate
