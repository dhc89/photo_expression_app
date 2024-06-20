class BookmarksController < ApplicationController
  def create
    @board = Board.find(params[:board_id])
    current_user.bookmark(@board)
  end

  def destroy
    @board = current_user.bookmarks.find(params[:id]).board
    current_user.unbookmark(@board)
  end

  def toggle_smile
    bookmark = Bookmark.find(params[:id])
    bookmark.smile = !bookmark.smile
    bookmark.save
    redirect_to bookmarks_path
  end

end
