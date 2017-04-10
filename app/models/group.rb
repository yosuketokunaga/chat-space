class Group < ApplicationRecord
  has_many :user, through: :group_users
end
