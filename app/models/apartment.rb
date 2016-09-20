class Apartment < ActiveRecord::Base
  has_attached_file :image, styles: { large: "600x600>", medium: "300x300>", thumb: "150x150#" }, default_url: "/images/:style/missing.png"
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  validates :address1, presence: true
  # validates :address2, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :postal_code, presence: true
  validates :country, presence: true
  validates :owner_name, presence: true
  validates :contact_time, presence: true
  validates :phone_number, presence: true

  geocoded_by :full_address
  after_validation :geocode

  def full_address
    @address1 = address1
    @city = city
    @full_address = (@address1 +", "+ @city)
  end
end
