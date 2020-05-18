class AddIsAdminAndFnameAndLnameAndIsProducerToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :isAdmin, :boolean, default: false
    add_column :users, :isProducer, :boolean, default: false
    add_column :users, :fname, :string, null: false
    add_column :users, :lname, :string, null: false
  end
end
