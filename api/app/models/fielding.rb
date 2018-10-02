class Fielding < ActiveRecord::Base
  belongs_to :field
  belongs_to :contentable, polymorphic: true
end
