class AddSuccessColumnToTestPassages < ActiveRecord::Migration[6.0]
  def change
    add_column :test_passages, :success_passed, :boolean
  end
end
