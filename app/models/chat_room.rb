class ChatRoom < ApplicationRecord
  # ルームは一人のルームマスターに紐づいている
  belongs_to :user
  # ルームにはN個のメッセージが存在する
  has_many :messages, dependent: :destroy
end
