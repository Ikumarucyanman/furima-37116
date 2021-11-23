class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
    # @items = Items.all
  end

  def new
    @item = Item.new
  end

end
