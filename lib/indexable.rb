module Indexable

  def reindex_post
    Post.reindex
  end

  def reindex_recipe
    Recipe.reindex
  end
  
end
