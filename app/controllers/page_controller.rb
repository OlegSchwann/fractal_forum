class PageController < ApplicationController
  # демонстрирует дерево комментариев
  def show
    id = (params[:id] || 1).to_i
    @comment_tree = Comment.comment_tree id
    if !@comment_tree
      redirect_to '/'
    end
    @is_login = ApplicationController.is_login?(cookies)
    if @is_login
      @login = cookies[:login]
    end
  end
end
