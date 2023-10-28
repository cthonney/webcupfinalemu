class DisasterJob < ApplicationJob
  queue_as :default

  def perform
    puts "I'm starting the fake job"
    sleep 3
    puts "OK I'm done now, the work was completed at #{DateTime.now}"
  end
end

Sidekiq::Cron::Job.create(name: 'DisasterAPI - every 5min', cron: '*/1 * * * *', class: 'DisasterJob')
