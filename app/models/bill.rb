class Bill < ApplicationRecord
  # Direct associations

  has_many   :billhasingredients,
             :class_name => "BillHasIngredient",
             :dependent => :destroy

  belongs_to :user,
             :counter_cache => true

  # Indirect associations

  has_many   :ingredients,
             :through => :billhasingredients,
             :source => :ingredient

  # Validations

end
