class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.integer :user_id
      t.integer :category_id
      t.string :title
      t.string :body
      t.datetime :start_time
      t.timestamps
    end
  end
end
