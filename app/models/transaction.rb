class Transaction < ApplicationRecord
  belongs_to :project

  validates :price, presence: true
end