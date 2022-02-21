require 'rails_helper'

RSpec.describe BuyerResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'buyers',
          attributes: { }
        }
      }
    end

    let(:instance) do
      BuyerResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { Buyer.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:buyer) { create(:buyer) }

    let(:payload) do
      {
        data: {
          id: buyer.id.to_s,
          type: 'buyers',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      BuyerResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { buyer.reload.updated_at }
      # .and change { buyer.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:buyer) { create(:buyer) }

    let(:instance) do
      BuyerResource.find(id: buyer.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { Buyer.count }.by(-1)
    end
  end
end
