class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      # ==========ここから追加する==========
      t.references :post, foreign_key: true, null: false
      t.references :user, foreign_key: true, null: false
      # ==========ここまで追加する==========
      t.timestamps
    end
  end
end