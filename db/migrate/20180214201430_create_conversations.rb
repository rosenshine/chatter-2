class CreateConversations < ActiveRecord::Migration[5.1]
  create_table :conversations do |t|
    t.timestamps
  end
end
