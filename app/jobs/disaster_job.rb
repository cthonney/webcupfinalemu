require "json"
require "open-uri"

DISASTERS_KEYS = {
  "éruption volcanique" => "Volcanic eruption",
  "tremblements de terre" => "Earthquakes",
  "Ouragan" => "Hurricane",
  "Cyclone" => "Cyclone",
  "Typhon" => "Typhoon",
  "Tsunami" => "Tsunami",
  "Inondations" => "Floods",
  "Mégafeu" => "Megafire"
}

class DisasterJob < ApplicationJob
  queue_as :default

  def perform
    begin
      fetch_and_process_disasters
    rescue StandardError => e
      Rails.logger.error("Error in DisasterJob: #{e.message}")
    end
  end

  private

  def fetch_and_process_disasters
    url = "https://www.webcup.fr/24hAPI/disaster.php"
    serialized_value = URI.parse(url).open.read
    disasters = JSON.parse(serialized_value)

    process_disasters(disasters)
  end

  def process_disasters(disasters)
    # Your code to process the disasters data goes here
    # For example, you can save it to your database or perform other operations.
    # puts disasters
    disasters.each do |disaster|
      puts "The diaster value: #{disaster}"
      # check if this disaster is already present in the database
      # if Disaster.find_by_fetched_id(disaster["id"])
      #   puts 'the disaster is new'

      # else
      #   puts 'disaster is already saved'
      # end

      existing_disaster = Disaster.find_by(fetched_id: disaster["id"])

      if existing_disaster
        puts "Disaster with ID #{disaster["id"]} is already saved"
      else
        puts "Create a new disaster"
        new_disaster = Disaster.new(
          fetched_id: disaster["id"],
          disaster_type: DISASTERS_KEYS[disaster["type_disaster"]],
          latitude: disaster["latitude"].to_f,
          longitude: disaster["longitude"].to_f,
          magnitude: disaster["magnitude"].to_f
        )

        if new_disaster.save
          puts "New disaster with ID #{disaster["id"]} has been saved"
        else
          puts "Failed to save new disaster with ID #{disaster["id"]}"
        end
      end
    end
  end
end

Sidekiq::Cron::Job.create(name: 'DisasterAPI - every 5min', cron: '*/5 * * * *', class: 'DisasterJob')
