class Bookmark < ApplicationRecord
  # Bookmarkモデルはuserに属する（関連付けられている）ことを示している。つまり、ブックマークは一人のユーザーに紐づいているという関係を表している
  belongs_to :user
  # Bookmarkモデルはboardに属する（関連付けられている）ことを示している。つまり、ブックマークは一つの掲示板に紐づいているという関係を表している
  belongs_to :board

  # user_idが一意（ユニーク）であることを保証するバリデーション. ただし{}内にてこの一意性はboard_idのスコープ内でのみ適用される。つまり、同じboard_id内であればuser_idが重複しないようにするという意味。
  validates :user_id, uniqueness: { scope: :board_id }
end
