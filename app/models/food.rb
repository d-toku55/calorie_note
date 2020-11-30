class Food < ApplicationRecord

  def self.search(search)
    Food.where('food_name LIKE(?)', "%#{search}%")
  end

end
