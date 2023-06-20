class Project < ApplicationRecord
  belongs_to :client

  validates :name, presence: true
  validates :description, presence: true
  validates :duration, presence: true
  validates :priority, presence: true
  
  has_many :transactions
  
end
