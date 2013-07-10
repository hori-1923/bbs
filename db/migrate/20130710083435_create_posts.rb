class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :name, null: false
      t.string :title
      t.text :body

      t.timestamps
    end
    add_index :posts, [:name]
  end
end
