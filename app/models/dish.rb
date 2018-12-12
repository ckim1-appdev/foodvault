class Dish < ApplicationRecord
  # Direct associations

  has_many   :dishhasingredients,
             :class_name => "DishHasIngredient",
             :dependent => :destroy

  # Indirect associations

  # Validations

  validates :name, :presence => true

end
