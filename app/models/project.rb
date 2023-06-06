class Project < ApplicationRecord
  belongs_to :client

  validates :name, presence: true
  validates :description, presence: true
  validates :duration, presence: true

  
  has_one :team
  has_many :transactions
  has_many :notifications
  
end
