class Project < ApplicationRecord
  has_many :bugs
  has_many :users
end
