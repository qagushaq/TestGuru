class AddTimeToPassTests < ActiveRecord::Migration[6.0]
  def change
    add_column :tests, :time_to_pass, :integer
  end
end
