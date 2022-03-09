class RemoveManagerIdToBugs < ActiveRecord::Migration[7.0]
  def change
    remove_column :bugs, :tester_id, :integer
  end
end
