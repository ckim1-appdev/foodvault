class Ingredient < ApplicationRecord
  # Direct associations

  belongs_to :director,
             :class_name => "User",
             :foreign_key => "user_id",
             :counter_cache => :filmography_count

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
