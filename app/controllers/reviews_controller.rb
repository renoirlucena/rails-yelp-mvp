class ReviewsController < ApplicationController
  before_action :set_restaurant, only: %i[new create]
  def new
    # We need @restaurant in our `simple_form_for`
    # @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    # @restaurant = Restaurant.find(params[:restaurant_id])
    # # esta instância de reviews é criada com erros de validação
    @review = Review.new(review_params)
    # se refere ao restaurante que nos buscamos no metodo before_action
    # aqui associamos nosso restaurante ao nosso review
    @review.restaurant = @restaurant
    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new, status: :unprocessable_entity
      # UNPROCESSABLE ENTITY
      # indica que o servidor entende o tipo de conteúdo da entidade
      # solicitada e a sintaxe da entidade solicitada está correta,
      # mas não foi capaz de processar as instruções contidas.
    end
  end

  # def destroy
  #   @review = Review.find(params[:id])
  #   @review.destroy
  #   redirect_to restaurant_path(@review.restaurant), status: :see_other
  # end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end

# A visitor can see the details of a restaurant, with all the reviews related to the restaurant.
# GET "restaurants/38"
# A visitor can add a new review to a restaurant
# GET "restaurants/38/reviews/new"
# POST "restaurants/38/reviews"
# And that’s it!
# In our MVP, a visitor cannot update / delete any restaurant or review. This is the role of the admin (i.e. you) -
# as a developer you have the power to manipulate the DB from the rails console if you want to update /
# delete any record.
