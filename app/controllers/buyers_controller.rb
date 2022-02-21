class BuyersController < ApplicationController
  before_action :set_buyer, only: %i[show edit update destroy]

  def index
    @q = Buyer.ransack(params[:q])
    @buyers = @q.result(distinct: true).includes(:users, :items,
                                                 :messages).page(params[:page]).per(10)
  end

  def show
    @message = Message.new
    @item = Item.new
    @user = User.new
  end

  def new
    @buyer = Buyer.new
  end

  def edit; end

  def create
    @buyer = Buyer.new(buyer_params)

    if @buyer.save
      redirect_to @buyer, notice: "Buyer was successfully created."
    else
      render :new
    end
  end

  def update
    if @buyer.update(buyer_params)
      redirect_to @buyer, notice: "Buyer was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @buyer.destroy
    redirect_to buyers_url, notice: "Buyer was successfully destroyed."
  end

  private

  def set_buyer
    @buyer = Buyer.find(params[:id])
  end

  def buyer_params
    params.fetch(:buyer, {})
  end
end
