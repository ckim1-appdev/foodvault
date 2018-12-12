class Dish < ApplicationRecord
  # Direct associations

  has_many   :dishhasingredients,
             :class_name => "DishHasIngredient",
             :dependent => :destroy

  # Indirect associations

  has_many   :ingredients,
             :through => :dishhasingredients,
             :source => :ingredient

  # Validations

  validates :name, :presence => true

end
