class AddTesterIdToBugs < ActiveRecord::Migration[7.0]
  def change
    add_column :bugs, :tester_id, :integer, null: true
  end
end
