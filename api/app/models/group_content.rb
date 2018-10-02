class GroupContent < ActiveRecord::Base
  belongs_to :group
  has_one :contents, as: :contentable
end
