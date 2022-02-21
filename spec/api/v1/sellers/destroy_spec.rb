require 'rails_helper'

RSpec.describe "sellers#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/sellers/#{seller.id}"
  end

  describe 'basic destroy' do
    let!(:seller) { create(:seller) }

    it 'updates the resource' do
      expect(SellerResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { Seller.count }.by(-1)
      expect { seller.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
