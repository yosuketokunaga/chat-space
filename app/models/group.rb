class Group < ApplicationRecord
  validates :name, presence: true
  validates :users, presence: true

  has_many :group_users
  has_many :users, through: :group_users
  accepts_nested_attributes_for :users
  has_many :messages
end
