# Requiert la gem 'childprocess'
require 'childprocess'

# Vérifie si Rails est en mode production
if Rails.env.production?
  # Crée un processus enfant pour Sidekiq
  process = ChildProcess.build('bundle', 'exec', 'sidekiq', '-C', 'config/sidekiq.yml')

  # Redirige stdout et stderr vers des fichiers logs (optionnel)
  process.io.stdout = process.io.stderr = File.open("log/sidekiq.log", "a+")

  # Démarre le processus en arrière-plan
  process.start
end
