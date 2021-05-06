class CreateBadges < ActiveRecord::Migration[6.0]
  def change
    create_table :badges do |t|
      t.string :title, index: true, null: false
      t.string :image, null: false
      t.string :rule, null: false
      t.string :value, null: false

      t.timestamps
    end
  end
end
