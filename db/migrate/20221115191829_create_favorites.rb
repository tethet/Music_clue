class CreateFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :favorites do |t|
      t.integer :user_id,          null: false, default: ""
      t.integer :review_id,        null: false, default: ""

      t.timestamps
    end
  end
end
