class CreateTests < ActiveRecord::Migration[6.0]
  def change
    create_table :tests do |t|
      t.integer :title
      t.integer :level
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
