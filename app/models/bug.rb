# frozen_string_literal: true

class Bug < ApplicationRecord
  belongs_to :project
  has_many :comments
  has_many :users
end
