class AddFlagsToBookmarks < ActiveRecord::Migration[7.0]
  def change
    add_column :bookmarks, :smile, :boolean, default: false
    add_column :bookmarks, :angry, :boolean, default: false
    add_column :bookmarks, :sad, :boolean, default: false
  end
end
# 次のコマンドで作成
# docker compose run web rails generate migration AddFlagsToBookmarks smile:boolean angry:boolean sad:boolean