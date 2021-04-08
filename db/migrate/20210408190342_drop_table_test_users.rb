class DropTableTestUsers < ActiveRecord::Migration[6.0]
  def up
    drop_table :test_users, if_exists: true
  end
end
