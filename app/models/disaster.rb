class Disaster < ApplicationRecord
  has_many :reviews, dependent: :destroy
end
