# frozen_string_literal: true

class AddBugRefToComments < ActiveRecord::Migration[7.0]
  def change
    add_reference :comments, :bug, null: false, foreign_key: true
  end
end
