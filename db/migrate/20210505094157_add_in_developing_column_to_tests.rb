class AddInDevelopingColumnToTests < ActiveRecord::Migration[6.0]
  def change
    add_column :tests, :in_developing, :boolean
  end
end
