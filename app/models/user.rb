class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # ユーザーはN個のルームを作成できる
  has_many :chat_rooms, dependent: :destroy
  # ユーザーはN個のメッセージを作成できる
  has_many :messages, dependent: :destroy

  # ユーザー名は2~20文字
  validates :name, presence: true, length: { minimum: 2, maximum: 20 }

  #ユーザー名を利用してログインするようにオーバーライド
  def self.find_first_by_auth_conditions(warden_conditions)
  conditions = warden_conditions.dup
  if login = conditions.delete(:login)
    #認証の条件式を変更する
    where(conditions).where(["name = :value", { :value => name }]).first
  else
    where(conditions).first
  end
end

end
