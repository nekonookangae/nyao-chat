class AddExplanationToChatRooms < ActiveRecord::Migration[5.2]
  def change
    add_column :chat_rooms, :explanation, :string
  end
end
