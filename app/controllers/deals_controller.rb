class DealsController < ApplicationController
  def index
    @deals = current_user.deals
  end
  def show
  end
end
