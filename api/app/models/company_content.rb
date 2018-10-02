class CompanyContent < ActiveRecord::Base
  belongs_to :company
  has_one :contents, as: :contentable
end
