class Ingredient < ApplicationRecord
  mount_uploader :picture, PictureUploader

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

  has_many   :bills,
             :through => :billhasingredients,
             :source => :bill

  has_many   :dishes,
             :through => :dishhasingredients,
             :source => :dish

  # Validations

  validates :name, :presence => true

  validates :user_id, :presence => true

end
