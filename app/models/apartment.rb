class Apartment < ActiveRecord::Base
  validates :address1, presence: true
  # validates :address2, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :postal_code, presence: true
  validates :country, presence: true
  validates :owner_name, presence: true
  validates :contact_time, presence: true
  validates :phone_number, presence: true

  geocoded_by :address1
  after_validation :geocode

end
