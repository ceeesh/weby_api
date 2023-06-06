class Dev < ApplicationRecord
  belongs_to :team

  include Authentication
end