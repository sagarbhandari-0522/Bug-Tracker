class RemoveStatusFromBugss < ActiveRecord::Migration[7.0]
  def change
    remove_column :bugs, :status, :integer
  end
end
