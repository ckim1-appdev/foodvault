require 'rails_helper'

RSpec.describe Bill, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:billhasingredients) }

    it { should belong_to(:user) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do
      
    end
end
