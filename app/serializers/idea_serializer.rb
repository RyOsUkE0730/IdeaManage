class IdeaSerializer < ActiveModel::Serializer
  attributes :id,:category,:body,:created_at
  # 返却するJSON形式を指定
  
  def category
    object.category.name
  end
end
