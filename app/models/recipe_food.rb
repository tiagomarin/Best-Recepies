class RecipeFood < ApplicationRecord
  belongs_to :recipe
  belongs_to :food

  validates :quantity, presence: true, numericality: { only_float: true, greater_than_or_equal_to: 0 }
  validates :food_id, uniqueness: { scope: :recipe_id }
end
