class GroupUser < ApplicationRecord
  belongs_to :group
  belongs_to :user
  has_many :messages

  validates :group, presence: true
  validates :user, presence: true
end
