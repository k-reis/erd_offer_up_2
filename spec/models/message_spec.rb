require "rails_helper"

RSpec.describe Message, type: :model do
  describe "Direct Associations" do
    it { should belong_to(:buyer) }

    it { should belong_to(:seller) }

    it { should belong_to(:item) }
  end

  describe "InDirect Associations" do
    it { should have_one(:user) }
  end

  describe "Validations" do
  end
end
