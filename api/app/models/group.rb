class Group < ActiveRecord::Base
  has_and_belongs_to_many :users

  has_many :group_messages
  has_many :group_contents
end
