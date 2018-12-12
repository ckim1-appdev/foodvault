class BillHasIngredient < ApplicationRecord
  # Direct associations

  belongs_to :bill,
             :counter_cache => :billhasingredients_count

  belongs_to :ingredient,
             :counter_cache => :billhasingredients_count

  # Indirect associations

  # Validations

end
