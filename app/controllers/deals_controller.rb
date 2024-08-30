class DealsController < ApplicationController
  def index
    byebug
    @deals = current_user.deals
  end
  def show
  end
end
