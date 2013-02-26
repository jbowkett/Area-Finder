$LOAD_PATH << File.join(File.dirname(__FILE__), "..")

require_relative 'csv_file_aggregator_and_loader'
require_relative 'school_downloader'

def aggregate_journeys_data
  input_dir = ARGV[0]
  puts 'Aggregating input files...'
  aggregator = CSVFileAggregatorAndLoader.new(input_dir)

  aggregator.aggregate
  puts 'Areas aggregated and saved.'
end

def download_schools
  puts 'Downloading schools data...'
  school_downloader = SchoolDownloader.new
  Area.all.each do |area|
    if area.schools.size == 0
      school_downloader.inspect_area(area)
      area.save!
    end
  end
  puts 'Schools data downloaded.'
end


ActiveRecord::Base.establish_connection(
    :adapter  => "mysql",
    :host     => "localhost",
    :username => "root",
    :password => "",
    :database => "area_finder"
)

aggregate_journeys_data if ARGV.include?'-aggregate-journeys'

download_schools if ARGV.include?'-download-schools'

#puts 'Combining schools data...'
# Aggregate here
#puts 'Schools data summarised.'




