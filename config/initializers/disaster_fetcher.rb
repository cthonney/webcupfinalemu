require "json"
require "open-uri"

# Mapping des types de catastrophes en français et en anglais
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

class DisasterJob
  # Méthode pour exécuter la tâche
  def self.perform
    begin
      fetch_and_process_disasters
    rescue StandardError => e
      Rails.logger.error("Error in DisasterJob: #{e.message}")
    end
  end

  private

  # Méthode pour récupérer et traiter les données de catastrophes
  def self.fetch_and_process_disasters
    url = "https://www.webcup.fr/24hAPI/disaster.php"
    serialized_value = URI.parse(url).open.read
    disasters = JSON.parse(serialized_value)

    process_disasters(disasters)
  end

  # Méthode pour traiter les données de catastrophes
  def self.process_disasters(disasters)
    disasters.each do |disaster|
      # Recherche d'une catastrophe existante dans la base de données
      existing_disaster = Disaster.find_by(fetched_id: disaster["id"])

      if existing_disaster
        puts "Disaster with ID #{disaster['id']} is already saved"
      else
        puts "Creating a new disaster"

        # Création d'une nouvelle catastrophe
        new_disaster = Disaster.new(
          fetched_id: disaster["id"],
          disaster_type: DISASTERS_KEYS[disaster["type_disaster"]],
          latitude: disaster["latitude"].to_f,
          longitude: disaster["longitude"].to_f,
          magnitude: disaster["magnitude"].to_f
        )

        if new_disaster.save
          puts "New disaster with ID #{disaster['id']} has been saved"
        else
          puts "Failed to save new disaster with ID #{disaster['id']}"
        end
      end
    end
  end
end

# Créer un thread pour exécuter le code tous les 300 secondes (5 minutes)
Thread.new do
  loop do
    DisasterJob.perform
    sleep 300  # Modification à 300 secondes (5 minutes)
  end
end
