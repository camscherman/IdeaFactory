class IdeasController < ApplicationController
  before_action :find_idea, only:[:show, :edit, :update, :destroy]

  def index
    @idea = Idea.new
    @ideas = Idea.order(created_at: :desc)
  end

  def new
    @idea = Idea.new
  end

  def create

    @idea = Idea.new(idea_params)
    if @idea.save
      flash[:notice] = "Idea Saved"
      redirect_to ideas_path
    else
      flash.now[:alert] = @idea.errors.full_messages.join(', ')
      render :new
    end
  end

  def show
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
end
