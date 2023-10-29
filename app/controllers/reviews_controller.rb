class ReviewsController < ApplicationController


  def create
    @disaster = Disaster.find(params[:disaster_id])
    @review = Review.new(review_params)
    @review.disaster = @disaster
    if @review.save
      redirect_to disaster_path(@disaster)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def review_params
    params.require(:review).permit(:is_safe, :comment, :full_name, :email)
  end

end
