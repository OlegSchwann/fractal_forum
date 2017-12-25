class AddCommentController < ApplicationController
  def add
    @is_login = AddCommentController.is_login?(cookies)
    if @is_login
      comment = Comment.new
      comment.message = params[:message]
      comment.perent_comment_id = params[:perent_comment_id]
      comment.login = cookies[:login]
      if comment.save
        render status: 200, json: {status: 'success'}
      else
        render status: 406, json: {status: 'Attribute error'}
      end
    else
      render status: 406, json: {status: 'Not autorised'}
    end
  end
end
