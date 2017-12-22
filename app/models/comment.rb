class Comment < ApplicationRecord
    attr_accessor :child_comments
    validates :login, :presence => true
    validates :message, :presence => true

    def Comment.comment_tree(comment_id)
        # заглавный комментарий - пост
        root = Comment.find_by_id(comment_id)
        get_child(root, 5)
        p root
        return root
    end

    private

    # функция рекурсивного обхода
    # принимает элемент, к которому надо присоединить ветку
    # принимает глубину - количество слоёв, которое надо присоединить
    # рекурсивный случай - принимаем глубину n, находим все дочерние комментарии
    def Comment.get_child(comment, depth)
        if comment != NIL && depth > 0
            comment.child_comments = Comment.where("perent_comment_id = ?", comment.id)
            if comment.child_comments != NIL
                comment.child_comments =
                    comment.child_comments.sort_by {|comment| comment.updated_at}.reverse
                for i in comment.child_comments
                    get_child(i, depth - 1)
                end
            end
        end
    end
end
