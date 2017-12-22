class AddCommentController < ApplicationController
  def add
    p params
    comment = Comment.new
    p comment.message = params[:message]
    p comment.perent_comment_id = params[:perent_comment_id]
    comment.login = 'Anon'

    if comment.save
      render status: 200, json: {status: 'success'}
    else
      render status: 406, json: {status: 'Error'}
    end
  end
end
