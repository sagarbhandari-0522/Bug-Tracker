class AddDeveloperIdToBugs < ActiveRecord::Migration[7.0]
  def change
    add_column :bugs, :developer_id, :integer, null: true
  end
end
