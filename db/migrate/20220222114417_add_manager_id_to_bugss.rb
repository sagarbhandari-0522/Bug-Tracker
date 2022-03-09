class AddManagerIdToBugss < ActiveRecord::Migration[7.0]
  def change
    add_column :bugs, :manager_id, :integer
  end
end
