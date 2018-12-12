class Bill < ApplicationRecord
  # Direct associations

  has_many   :billhasingredients,
             :class_name => "BillHasIngredient",
             :dependent => :destroy

  belongs_to :user,
             :counter_cache => true

  # Indirect associations

  # Validations

end
