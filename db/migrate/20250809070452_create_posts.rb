class CreatePosts < ActiveRecord::Migration[7.2]
  def change
    create_table :posts do |t|
      t.string :name
      t.text :about
      t.string :image
      t.text :link

      t.timestamps
    end
  end
end
