require "rails_helper"

RSpec.describe User, type: :model do
  describe "Direct Associations" do
    it { should belong_to(:buyer) }

    it { should belong_to(:seller) }
  end

  describe "InDirect Associations" do
    it { should have_one(:item) }

    it { should have_one(:message) }
  end

  describe "Validations" do
  end
end
