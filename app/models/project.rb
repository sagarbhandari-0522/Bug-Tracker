# frozen_string_literal: true

class Project < ApplicationRecord
  has_many :bugs, dependent: :delete_all
  belongs_to :user
end
