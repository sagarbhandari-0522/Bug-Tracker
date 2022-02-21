# frozen_string_literal: true

class Project < ApplicationRecord
  has_many :bugs
  has_many :users
end
