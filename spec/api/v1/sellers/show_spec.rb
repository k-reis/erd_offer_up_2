require 'rails_helper'

RSpec.describe "sellers#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/sellers/#{seller.id}", params: params
  end

  describe 'basic fetch' do
    let!(:seller) { create(:seller) }

    it 'works' do
      expect(SellerResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('sellers')
      expect(d.id).to eq(seller.id)
    end
  end
end
