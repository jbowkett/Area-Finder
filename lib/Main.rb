$LOAD_PATH << File.join(File.dirname(__FILE__), "..")

require_relative 'csv_file_aggregator_and_loader'
require_relative 'school_downloader'
require_relative 'area_summariser'

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
  AreaSummary.all.each do |area_summary|
    area = area_summary.area
    if area_summary.include_in_school_search && area.schools.size < 40
      school_downloader.inspect_area(area)
      area_summary.include_in_school_search = false
      area.save!
    end
  end
  puts 'Schools data downloaded.'
end

def summarise_areas
  puts 'Summarising areas...'
  Area.all.each do |area|
    AreaSummariser.set_summary_for(area)
    area.save!
  end
  puts 'Areas summarised.'
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

summarise_areas if ARGV.include?'-summarise-areas'


