class Board < ApplicationRecord
  mount_uploader :board_image, BoardImageUploader
  validates :title, presence: true, length: { maximum: 255 }

  # 'presence: true': body属性に対してbodyが空でないことを確認するバリデーション
  # 'length: { maximum: 65_535 }': body属性に対してbodyの長さが65,535文字以下であることを確認するバリデーション
  validates :body, presence: true, length: { maximum: 65_535 }

  # このモデル（例えば、Boardモデル）はuserに属する（関連付けられている）ことを示している。つまり、ボードは一人のユーザーに紐づいているという関係を表している
  belongs_to :user

  # ,前：あるモデル（例えば、Boardモデル）が複数のコメント（Commentモデル）を持つという関係を定義しているナ。Boardモデルのインスタンスが複数のCommentモデルのインスタンスと関連付けられるゾ。
  # ,後：Boardモデルのインスタンスが削除されたときに、そのインスタンスに関連するコメント（Commentモデルのインスタンス）も一緒に削除されるようにするオプションだナ。これによって、関連するコメントがデータベースに残らないようにするダナ。
  # まとめ：「このモデルには多数のコメントがあり、モデルが削除されるとそのコメントも一緒に削除される」という関係を設定してる
  has_many :comments, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
end
