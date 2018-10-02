class UserContent < ActiveRecord::Base
  belongs_to :user
  has_one :contents, as: :contentable
end
