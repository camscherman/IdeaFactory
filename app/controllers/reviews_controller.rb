class ReviewsController < ApplicationController
   before_action :find_idea, only:[:create]
   before_action :find_review, only: [:destroy]
   before_action :authenticate_user!
   before_action :authorize_user!,only: [:destroy]

  def create
    @review = @idea.reviews.build(review_params)
    @review.user = current_user
    if @review.save
      flash[:notice] = "Review Posted"
      redirect_to idea_path(@idea)
    else
      render 'ideas/show'
    end

    # render json: params
  end

  def destroy
    @review.destroy
    redirect_to idea_path(@review.idea), notice: "Review deleted"
  end

  private
  def review_params
    params.require(:review).permit(:title, :body)
  end

  def find_idea
    @idea = Idea.find(params[:idea_id])
  end

  def authorize_user!
    unless can?(:manage, @review)
      redirect_to root_path, alert: "You don't have permission to do this!"
    end
  end

  def find_review
    @review = Review.find(params[:id])
  end
end
