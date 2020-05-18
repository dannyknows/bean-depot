class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.integer :price, null: false
      t.references :producer, null: false, foreign_key: true
      t.references :origin, null: false, foreign_key: true
      t.integer :grind_type, null: false
      t.boolean :isDecaf, null: false

      t.timestamps
    end
  end
end
