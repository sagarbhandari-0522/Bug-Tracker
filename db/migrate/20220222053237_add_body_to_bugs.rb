class AddBodyToBugs < ActiveRecord::Migration[7.0]
  def change
    add_column :bugs, :body, :string
  end
end
