class IdeasController < ApplicationController

  # def index
  #   @ideas = current_user.ideas.all
  # end
  def index
    @ideas = current_user.ideas.all.map { |idea| IdeaPresenter.new(idea) }
  end

  def new
    @idea = current_user.ideas.new  
  end

  def show
    @idea = current_user.ideas.find(params[:id])  
  end
  
  def create
    @idea = current_user.ideas.new(idea_params)
    if @idea.save
      flash[:success] = "That one's a zinger!"
      redirect_to ideas_path
    else
      flash[:errors] = @idea.errors.full_messages.join(", ")
      render :new
    end
  end

  def edit
    @idea = current_user.ideas.find(params[:id])
  end

  def update
    @idea = current_user.ideas.find(params[:id])
    if @idea.update(idea_params)
      redirect_to ideas_path
    else
      render :edit
    end
  end

  def destroy
    @idea = current_user.ideas.find(params[:id])
    @idea.destroy
    redirect_to ideas_path
  end

  private

  def idea_params
    params.require(:idea).permit(:name, 
                                 :description,
                                 :category_id)
  end

end