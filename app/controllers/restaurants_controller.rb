class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: %i[show edit update]

  # CREATE
  def create
    @restaurant = Restaurant.create(restaurant_params)
    if @restaurant.save
      redirect_to @restaurant, notice: 'Restaurant was successfully created.'
    else
      # Shows an error message if something goes wrong
      render :new, status: :unprocessable_entity
    end
  end

  def new
    @restaurant = Restaurant.new
  end

  # READ

  def index
    @restaurants = Restaurant.all
  end

  def show; end

  # UPDATE

  def edit; end

  def update
    if @restaurant.update(restaurant_params)
      redirect_to @restaurant, notice: 'Restaurant was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end
end

# Prefix Verb  URI Pattern                                       Controller#Action
# restaurant_reviews POST  /restaurants/:restaurant_id/reviews(.:format)     reviews#create
# new_restaurant_review GET   /restaurants/:restaurant_id/reviews/new(.:format) reviews#new
#        restaurants GET   /restaurants(.:format)                            restaurants#index
#                    POST  /restaurants(.:format)                            restaurants#create
#     new_restaurant GET   /restaurants/new(.:format)                        restaurants#new
#    edit_restaurant GET   /restaurants/:id/edit(.:format)                   restaurants#edit
#         restaurant GET   /restaurants/:id(.:format)                        restaurants#show
#                    PATCH /restaurants/:id(.:format)                        restaurants#update
#                    PUT   /restaurants/:id(.:format)                        restaurants#update
