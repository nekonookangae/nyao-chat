class ChatRoom < ApplicationRecord
  # ルームは一人のルームマスターに紐づいている
  belongs_to :user
  # ルームにはN個のメッセージが存在し、削除はそのルームでのみ行える
  has_many :messages, dependent: :destroy
end
