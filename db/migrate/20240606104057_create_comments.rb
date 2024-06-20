class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.references :user, foreign_key: true
      t.references :board, foreign_key: true
      t.text :body

      t.timestamps
    end
  end
end
# 次のコマンドで作成し、null:falseを削除して作成したファイル
# % docker compose exec web rails generate migration CreateComments user:references board:references body:text 