class BoardsController < ApplicationController
  before_action :set_board, only: %i[edit update destroy]
  before_action :authorize_user!, only: %i[edit update destroy]

  def index
    #  gemのひとつransakを使用。
    @q = Board.ransack(params[:q])
    @boards = @q.result(distinct: true).includes(:user).page(params[:page]).order(created_at: :desc)
  end

  def show
    # params[:id]で受け取ったIDを使って、Boardモデルから特定の掲示板を検索し、@boardインスタンス変数に格納する。これにより、ビューで特定の掲示板のデータにアクセスできるようになる。
    @board = Board.find(params[:id])
    # 新しいコメントを作成するためのCommentモデルのインスタンスを生成し、@commentインスタンス変数に格納する。これにより、ビューで新しいコメントを投稿するフォームを表示できるようになる。
    @comment = Comment.new
    # 特定の掲示板に関連する全てのコメントを取得し、@commentsインスタンス変数に格納する.includes(:user)を使って、コメントに関連するユーザー情報を事前にロードすることで、N+1クエリ問題を防ぐ.order(created_at: :desc)を使って、コメントを作成日時の降順（最新のコメントが最初）に並べ替える
    @comments = @board.comments.includes(:user).order(created_at: :desc)
  end

  def new
    @board = Board.new
  end

  def edit
    # 現在ログインしているユーザーのボードの中から指定されたIDのボードを探し、@boardに格納する。これにより、ビューで@boardのデータを使ってフォームを表示できるようになる。
    @board = current_user.boards.find(params[:id])
  end

  def create
    @board = current_user.boards.build(board_params)
    if @board.save
      redirect_to boards_path, success: t('defaults.flash_message.created', item: Board.model_name.human)
    else
      flash.now[:danger] = t('defaults.flash_message.not_created', item: Board.model_name.human)
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @board = current_user.boards.find(params[:id])
    if @board.update(board_params)
      # 成功メッセージを表示するためにflash[:success]をセット。
      redirect_to board_path(@board), success: t('defaults.flash_message.updated', item: Board.model_name.human)
    else
      # エラーメッセージをflash.now[:danger]にセットし、編集画面を再表示.ステータスコードunprocessable_entity（422）を返す。
      flash.now[:danger] = t('defaults.flash_message.not_updated', item: Board.model_name.human)
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @board = current_user.boards.find(params[:id])
    # destroy!メソッドで削除。
    @board.destroy!
    # 削除成功後、ボード一覧ページ（boards_path）にリダイレクト。成功メッセージを表示するためにflash[:success]をセットし、ステータスコードsee_other（303）を返す。
    redirect_to boards_path, success: t('defaults.flash_message.deleted', item: Board.model_name.human), status: :see_other
  end

  def bookmarks
    @q = current_user.bookmark_boards.ransack(params[:q])
    @bookmark_boards = @q.result(distinct: true).includes(:user).order(created_at: :desc).page(params[:page])
  end

  private

  def board_params
    params.require(:board).permit(:title, :body, :board_image, :board_image_cache)
  end

  def set_board
    @board = Board.find(params[:id])
  end

  def authorize_user!
    raise ActiveRecord::RecordNotFound unless @board.user == current_user
  end
end
