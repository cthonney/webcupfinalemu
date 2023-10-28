# config/initializers/disaster_fetcher.rb

# Requérir les dépendances
require "json"
require "open-uri"

# Définition de la classe et des méthodes
class DisasterJob
  def self.perform
    begin
      fetch_and_process_disasters
    rescue StandardError => e
      Rails.logger.error("Error in DisasterJob: #{e.message}")
    end
  end

  private

  def self.fetch_and_process_disasters
    url = "https://www.webcup.fr/24hAPI/disaster.php"
    serialized_value = URI.parse(url).open.read
    disasters = JSON.parse(serialized_value)

    process_disasters(disasters)
  end

  def self.process_disasters(disasters)
    # Votre code pour traiter les données des catastrophes va ici
    puts disasters
  end
end

# Créer un thread pour exécuter le code tous les 300 secondes (5 minutes)
Thread.new do
  loop do
    DisasterJob.perform
    sleep 30
  end
end
