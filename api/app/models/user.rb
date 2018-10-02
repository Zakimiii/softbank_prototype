class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :timeoutable, :trackable, :omniauthable

  has_and_belongs_to_many :groups

  has_many :companies, through: :agreements
  has_many :tags, through: :fieldings

  has_many :user_contents
  has_many :user_messages
end
