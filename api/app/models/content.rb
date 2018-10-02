class Content < ActiveRecord::Base
  belongs_to :contentable, polymorphic: true
end
