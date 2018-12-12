class Ingredient < ApplicationRecord
  # Direct associations

  has_many   :dishhasingredients,
             :class_name => "DishHasIngredient",
             :dependent => :nullify

  has_many   :billhasingredients,
             :class_name => "BillHasIngredient",
             :dependent => :nullify

  # Indirect associations

  # Validations

  validates :name, :presence => true

  validates :user_id, :presence => true

end
