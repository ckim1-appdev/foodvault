class User < ApplicationRecord
  # Direct associations

  has_many   :bills,
             :dependent => :destroy

  has_many   :filmography,
             :class_name => "Ingredient",
             :dependent => :nullify

  # Indirect associations

  # Validations

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
