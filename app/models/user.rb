# frozen_string_literal: true

class User < ApplicationRecord
  has_one_attached :profile_picture
  rolify
  belongs_to :project
  belongs_to :bug
  after_create :assign_default_role

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  def assign_default_role
    add_role(:developer) if roles.blank?
  end
end
