class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      # ещё есть первичный ключ
      t.text :message
      t.string :login
      t.integer :perent_comment_id
      t.timestamps
    end
  end
end
