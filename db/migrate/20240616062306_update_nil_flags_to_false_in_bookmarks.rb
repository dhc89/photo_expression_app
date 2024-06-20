class UpdateNilFlagsToFalseInBookmarks < ActiveRecord::Migration[7.0]
  def up
    Bookmark.where(smile: nil).update_all(smile: false)
    #execute "UPDATE bookmarks SET smile = 'false' WHERE smile IS NULL"
    Bookmark.where(sad: nil).update_all(sad: false)
    #execute "UPDATE bookmarks SET sad = 'false' WHERE sad IS NULL"
    Bookmark.where(angry: nil).update_all(angry: false)
    #execute "UPDATE bookmarks SET angry = 'false' WHERE angry IS NULL"
  end

  def down
    # 元に戻す必要がある場合の処理。今回は何もしない。
  end
end