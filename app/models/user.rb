class User < ActiveRecord::Base
  validates :name, presence: true
  validates :email, presence: true, email: true
  validates :email, uniqueness: true

  has_many :apartments
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
end
