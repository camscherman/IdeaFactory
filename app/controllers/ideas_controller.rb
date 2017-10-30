class IdeasController < ApplicationController
  before_action :find_idea, only:[:show, :edit, :update, :destroy]
  before_action :authorize_user!, except: [:new, :index, :show, :create]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @idea = Idea.new
    @ideas = Idea.order(created_at: :desc)
  end

  def new
    @idea = Idea.new
  end

  def create

    @idea = Idea.new(idea_params)
    @idea.user = current_user
    if @idea.save
      flash[:notice] = "Idea Saved"
      redirect_to ideas_path
    else
      flash.now[:alert] = @idea.errors.full_messages.join(', ')
      render :new
    end
  end

  def show
    @review = Review.new
    @reviews = @idea.reviews.order(created_at: :desc)
  end

  def edit
  end

  def update
    @idea.update(idea_params)
    flash[:notice] = 'Idea Updated'
    redirect_to ideas_path
  end

  def destroy
    @idea.destroy
    redirect_to ideas_path
  end

  private
  def idea_params
    params.require(:idea).permit(:title, :description)
  end

  def find_idea
    @idea= Idea.find(params[:id])
  end

  def authorize_user!
    unless can?(:manage, @idea)
      flash[:alert] = "You don't have permission to that!"
      redirect_to root_path
    end
  end
end
