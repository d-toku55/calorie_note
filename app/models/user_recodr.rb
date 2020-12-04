class UserRecodr < ApplicationRecord

  belongs_to :user

  NUMDER_INT = /\A[0-9]+\z/

  with_options presence: true do
    validates :date
    validates :food_name
    validates :kcal, format: { with: NUMDER_INT }
  end
  validates :g, format: { with: NUMDER_INT }
end
