class Comment < ApplicationRecord
  belongs_to :user

  # この行を追加する
  belongs_to :post
end