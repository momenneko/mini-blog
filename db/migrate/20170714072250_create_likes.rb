class CreateLikes < ActiveRecord::Migration[5.1]
  def change
    create_table :likes do |t|
      t.integer :num
      t.references :post, index: true

      t.timestamps
    end
  end
end
