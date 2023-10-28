namespace :disaster do
  desc "Fetch and process disasters"
  task fetch: :environment do
    DisasterJob.perform
  end
end
