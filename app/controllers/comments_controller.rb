class CommentsController < ApplicationController
  # ↑コメントに関するアクションを処理するコントローラー
  # ユーザーがコメントを新しく作成し、それを保存する処理が実現されるダナ。
  # 保存の成否に応じて、適切なメッセージを表示しつつ掲示板の詳細ページにリダイレクトする仕組みだナ

  # createアクションは、新しいコメントを作成するためのアクション
  def create
    # 現在ログインしているユーザー（current_user）のコメントを新しく作成するためのインスタンスを生成している.
    # comment_paramsメソッドで取得したパラメータを使ってコメントを構築する.
    @comment = current_user.comments.build(comment_params)
    @comment.save
  end

  def destroy
    @comment = current_user.comments.find(params[:id])
    @comment.destroy!
  end
  # private以下のメソッドは、このコントローラー内でのみ使われることを示す

  private

  # 強いパラメータ（Strong Parameters）を使って、コメントに必要なパラメータを許可するメソッド
  def comment_params
    # paramsからcommentキーを必須とし、その中のbody属性を許可するダナ。また、board_idをマージしているゾ。
    params.require(:comment).permit(:body).merge(board_id: params[:board_id])
  end
end
