class Recipe < ApplicationRecord
  belongs_to :user, counter_cache: :recipes_counter
  has_many :recipe_foods
  has_many :foods, through: :recipe_foods

  validates :name, presence: true, length: { maximum: 40 }
  validates :preparation_time, presence: true, numericality: { only_float: true, greater_than_or_equal_to: 0 }
  validates :cooking_time, presence: true, numericality: { only_float: true, greater_than_or_equal_to: 0 }
  validates :description, presence: true, length: { maximum: 300 }
  validates :public, inclusion: { in: [true, false], message: 'Please, select one!' }
end
