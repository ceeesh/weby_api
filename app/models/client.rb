class Client < ApplicationRecord

  validates :email, presence: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: "must be a valid email address"}, uniqueness: true
  validates :password, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :gender, presence: true
  validates :phone_number, presence: true
  validates :country, presence: true
  validates :birthday, presence: true

  has_many :projects, dependent: :delete_all
  has_many :bookings, dependent: :delete_all
  # has_one_attached :profile_picture
  
  include Authentication
end
