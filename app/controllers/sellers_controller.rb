class SellersController < ApplicationController
  before_action :set_seller, only: %i[show edit update destroy]

  def index
    @q = Seller.ransack(params[:q])
    @sellers = @q.result(distinct: true).includes(:users, :items,
                                                  :messages).page(params[:page]).per(10)
  end

  def show
    @message = Message.new
    @item = Item.new
    @user = User.new
  end

  def new
    @seller = Seller.new
  end

  def edit; end

  def create
    @seller = Seller.new(seller_params)

    if @seller.save
      redirect_to @seller, notice: "Seller was successfully created."
    else
      render :new
    end
  end

  def update
    if @seller.update(seller_params)
      redirect_to @seller, notice: "Seller was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @seller.destroy
    redirect_to sellers_url, notice: "Seller was successfully destroyed."
  end

  private

  def set_seller
    @seller = Seller.find(params[:id])
  end

  def seller_params
    params.fetch(:seller, {})
  end
end
