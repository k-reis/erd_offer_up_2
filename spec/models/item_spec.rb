require 'rails_helper'

RSpec.describe Item, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:buyer) }

    it { should belong_to(:seller) }

    it { should belong_to(:category) }

    it { should have_many(:messages) }

    end

    describe "InDirect Associations" do

    it { should have_one(:user) }

    end

    describe "Validations" do

    end
end
