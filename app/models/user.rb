class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :surname, :name, :phone_number, :country, presence: true
         has_one_attached :avatar
         after_initialize :set_default_values

  private

  def set_default_values
    self.admin ||= false
    self.ngo ||= false
    self.gov ||= false
  end

end
