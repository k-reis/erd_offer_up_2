require 'rails_helper'

RSpec.describe SellerResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'sellers',
          attributes: { }
        }
      }
    end

    let(:instance) do
      SellerResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { Seller.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:seller) { create(:seller) }

    let(:payload) do
      {
        data: {
          id: seller.id.to_s,
          type: 'sellers',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      SellerResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { seller.reload.updated_at }
      # .and change { seller.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:seller) { create(:seller) }

    let(:instance) do
      SellerResource.find(id: seller.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { Seller.count }.by(-1)
    end
  end
end
