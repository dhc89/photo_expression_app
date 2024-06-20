class Comment < ApplicationRecord
  # CommentモデルはApplicationRecordを継承している

  # presence: true：bodyが空でないことを確認するバリデーション
  validates :body, presence: true, length: { maximum: 65_535 }

  # コメントは一人のユーザーに紐づいている（userに属している）
  belongs_to :user
  # コメントは一つのボード（例えば、掲示板のポスト）に紐づいている（boardに属している）
  belongs_to :board
end
