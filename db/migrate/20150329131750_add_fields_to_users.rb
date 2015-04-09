class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :gender, :string
    add_column :users, :university_id, :integer
  end
end
