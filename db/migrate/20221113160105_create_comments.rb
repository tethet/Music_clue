class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.string :comment,          null: false, default: ""
      t.timestamps
    end
  end
end
