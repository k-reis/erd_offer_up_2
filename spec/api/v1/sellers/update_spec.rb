require "rails_helper"

RSpec.describe "sellers#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/sellers/#{seller.id}", payload
  end

  describe "basic update" do
    let!(:seller) { create(:seller) }

    let(:payload) do
      {
        data: {
          id: seller.id.to_s,
          type: "sellers",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(SellerResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { seller.reload.attributes }
    end
  end
end
