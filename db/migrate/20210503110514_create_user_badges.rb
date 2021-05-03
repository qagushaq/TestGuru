class CreateUserBadges < ActiveRecord::Migration[6.0]
  def change
    create_table :user_badges do |t|
      t.references :badge
      t.references :user

      t.timestamps
    end
  end
end
