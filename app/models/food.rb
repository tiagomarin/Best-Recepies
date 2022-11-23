class Food < ApplicationRecord
  belongs_to :user, counter_cache: :foods_counter
  has_many :recipes, through: :recipe_foods

  validates :name, presence: true, length: { maximum: 30 }
  validates :measurement_unit, presence: true, length: { maximum: 20 }
  validates :price, presence: true, numericality: { only_float: true, greater_than_or_equal_to: 0 }
  validates :quantity, presence: true, numericality: { only_float: true, greater_than_or_equal_to: 0 }
end
