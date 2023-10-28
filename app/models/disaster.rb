class Disaster < ApplicationRecord
  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode
  after_validation :set_default_address
  has_many :reviews, dependent: :destroy

  def set_default_address
    # Attribuer "sea" si l'attribut de géolocalisation est nil
    self.address ||= "Sea" if self.address.nil?
  end
end
