class Group < ApplicationRecord
  validates :name, presence: true

  has_many :group_users
  has_many :users, through: :group_users
  accepts_nested_attributes_for :users
end
