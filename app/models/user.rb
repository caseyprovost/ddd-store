class User < ApplicationRecord  
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable, :confirmable, :lockable

  validates :name, :username, presence: true
  validates :username, uniqueness: true, if: -> { username.present? }
end
