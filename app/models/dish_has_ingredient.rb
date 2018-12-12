class DishHasIngredient < ApplicationRecord
  # Direct associations

  belongs_to :dish

  belongs_to :ingredient,
             :counter_cache => :dishhasingredients_count

  # Indirect associations

  # Validations

end
