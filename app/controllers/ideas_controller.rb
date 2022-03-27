class IdeasController < ApplicationController
  def index
    # @category = inputs[:category]
    # if @category.nil?
    #   @idea = Idea.all
    # else
    #   @idea = Idea.find(@category)
    # end
  end

  def new
    @idea = Idea.new
  end

  def create
    @idea = Idea.new(idea_params)
    if @item.valid?
      @item.save
      render status: 201, json: { status: 201, message: "Success" }
    else
      render status: 422, json: { status: 422, message: "Error"}
    end
  end


  private 
  def idea_params
    params.require(:idea).permit(:category, :body)
  end
end
