class PageController < ApplicationController
  # демонстрирует дерево комментариев
  def show
    id = (params[:id] || 1).to_i
    @comment_tree = Comment.comment_tree id
  end
end

