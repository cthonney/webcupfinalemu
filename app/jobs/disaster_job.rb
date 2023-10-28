require "json"
require "open-uri"

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
    puts disasters
  end
end

Sidekiq::Cron::Job.create(name: 'DisasterAPI - every 5min', cron: '*/5 * * * *', class: 'DisasterJob')
