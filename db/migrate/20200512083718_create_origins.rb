class CreateOrigins < ActiveRecord::Migration[6.0]
  def change
    create_table :origins do |t|
      t.string :country

      t.timestamps
    end
  end
end
