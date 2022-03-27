class IdeasController < ApplicationController
  def index
    category_name = params[:category_name]
    # nilの場合
    if category_name.nil?
      @ideas = Idea.all
    else
      category = Category.find_by(category_name:category_name)
      if category.nil?
        render status: 404
      else
        @ideas = Idea.where(category_id:category.id)
      end
    end
    render json: @ideas
  end
  #パラメータで遅れているかどうか
  #送れていない場合は全権取得できているか
  #カテゴリーがある場合かつ、カテゴリーが見つかるか見つからないかのパターンでテストする
  #見つかった場合は、正しいデータが返せているか、見つからない場合は404が返せているか

  def new
    @idea = Idea.new
  end

  def create
    # categoriesテーブルにnameが存在するか
    category = Category.find_or_initialize_by(name:params[:category_name])
    if category.new_record?
      category.save
    end

    # categoriesテーブルにnameが存在する場合は、ideaテーブルに登録
    @idea = Idea.new(idea_params)
    @idea.category_id = category.id
    if @item.save
      render status: 201, json: { message: "Success" }
    else
      render status: 422, json: { message: "Error"}
    end
  end

  private 
  def idea_params
    params.require(:idea).permit(:body)
  end
end
