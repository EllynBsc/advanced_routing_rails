class ReviewsController < ApplicationController

  def new
    #raise
    @resto = Restaurant.find(params[:restaurant_id])
    #grabbing the restaurant id from the url. it's the restaurant that we want to attach the review to.
    @review = Review.new
    #new instance for my form
  end

  def create
    # raise
    # 1. Create a review instance with the review_strong_params
    @review = Review.new(review_strong_params)
    # 2. Get the restaurant instance thanks to the id in the URL
    @resto = Restaurant.find(params[:restaurant_id])
    # 3. Attach the restaurant instance from the url to the review that we're creating
    @review.restaurant_id = @resto.id #hardest step of the lecture
    #review.restaurant = resto
    # 4. save the review
    if @review.save
    #save returns a boolean: returns true or false
    #5. redirect the user to the show page of the restaurant. In this show page, we're going to display all the reviews attached to this specific restaurant
      redirect_to restaurant_path(@resto) #http request
    else
      render :new #rendering an action
    end
  end

  def destroy
    review = Review.find(params[:id])
    review.destroy
    redirect_to restaurant_path(review.restaurant_id)
    # redirect_to restaurant_path(review.restaurant)
  end


  private

  def review_strong_params
    params.require(:review).permit(:content)
  end
end
