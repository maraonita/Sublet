class AddCanceledToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :canceled, :boolean, default: :false
  end
end
