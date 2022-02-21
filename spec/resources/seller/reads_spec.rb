require "rails_helper"

RSpec.describe SellerResource, type: :resource do
  describe "serialization" do
    let!(:seller) { create(:seller) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(seller.id)
      expect(data.jsonapi_type).to eq("sellers")
    end
  end

  describe "filtering" do
    let!(:seller1) { create(:seller) }
    let!(:seller2) { create(:seller) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: seller2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([seller2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:seller1) { create(:seller) }
      let!(:seller2) { create(:seller) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      seller1.id,
                                      seller2.id,
                                    ])
        end
      end

      context "when descending" do
        before do
          params[:sort] = "-id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      seller2.id,
                                      seller1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
