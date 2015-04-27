class IdeaPresenter

  def initialize(idea)
    @idea = idea
  end

  def name
    @idea.name
  end

  def category_name
    @idea.category ? @idea.category.name : ""
  end

  def description
    @idea.description
  end

  def to_param
    @idea.to_param
  end
  
end