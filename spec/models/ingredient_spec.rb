require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:director) }

    it { should have_many(:dishhasingredients) }

    it { should have_many(:billhasingredients) }

    end

    describe "InDirect Associations" do

    it { should have_many(:dishes) }

    end

    describe "Validations" do

    it { should validate_presence_of(:name) }

    it { should validate_presence_of(:user_id) }
      
    end
end
