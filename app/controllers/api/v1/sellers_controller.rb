class Api::V1::SellersController < Api::V1::GraphitiController
  def index
    sellers = SellerResource.all(params)
    respond_with(sellers)
  end

  def show
    seller = SellerResource.find(params)
    respond_with(seller)
  end

  def create
    seller = SellerResource.build(params)

    if seller.save
      render jsonapi: seller, status: :created
    else
      render jsonapi_errors: seller
    end
  end

  def update
    seller = SellerResource.find(params)

    if seller.update_attributes
      render jsonapi: seller
    else
      render jsonapi_errors: seller
    end
  end

  def destroy
    seller = SellerResource.find(params)

    if seller.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: seller
    end
  end
end
