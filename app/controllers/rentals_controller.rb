class RentalsController < ApplicationController
  def index
    @rentals = Rental.all.order(status: :DESC)
  end
end
